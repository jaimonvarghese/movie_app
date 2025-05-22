import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/error_box_container.dart';
import 'package:movie_app/features/search/view/widgets/search_idle.dart';
import 'package:movie_app/features/search/view/widgets/search_result.dart';
import 'package:movie_app/features/search/viewmodel/search_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focusNode = FocusNode();

    // Fetch default search idle data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchViewmodel>(context, listen: false).fetchSearchMovies();
    });

    _searchController.addListener(() => setState(() {}));
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _isSearching =>
      _focusNode.hasFocus || _searchController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<SearchViewmodel>(
        builder: (context, searchViewmodel, _) {
          if (searchViewmodel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            );
          }

          if (searchViewmodel.error.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ErrorBoxContainer(
                error: searchViewmodel.error,
                onPressed: () {
                  searchViewmodel.fetchSearchMovies();
                  searchViewmodel.fetchSearchResultMovies('');
                },
              ),
            );
          }

          if (searchViewmodel.searchIdleList.isEmpty) {
            return const Center(
              child: Text(
                'No Data Found',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildSearchBar(searchViewmodel),
                  const SizedBox(height: 20),
                  Expanded(
                    child:
                        _isSearching
                            ? SearchResult(searchMovies: searchViewmodel)
                            : SearchIdle(searchMovies: searchViewmodel),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(SearchViewmodel searchViewmodel) {
    return Row(
      children: [
        _buildBackButton(),
        const SizedBox(width: 10),
        Expanded(
          child: CupertinoSearchTextField(
            controller: _searchController,
            focusNode: _focusNode,
            onChanged: (value) {
              final trimmed = value.trim();
              if (trimmed.isNotEmpty) {
                searchViewmodel.fetchSearchResultMovies(trimmed);
              }
            },
            padding: const EdgeInsets.all(15),
            keyboardType: TextInputType.text,
            borderRadius: BorderRadius.circular(30),
            backgroundColor: const Color(0xFF1E1E1E),
            prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Image.asset('assets/images/Expand_right_light.png'),
        ),
      ),
    );
  }
}
