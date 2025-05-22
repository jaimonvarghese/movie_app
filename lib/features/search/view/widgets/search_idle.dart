import 'package:flutter/material.dart';
import 'package:movie_app/features/search/view/widgets/recent_search_item.dart';
import 'package:movie_app/features/search/view/widgets/search_text_title.dart';
import 'package:movie_app/features/search/viewmodel/search_viewmodel.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key, required this.searchMovies});

  final SearchViewmodel searchMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Recent Search'),
        SizedBox(height: 15),
        Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final searchMovie = searchMovies.searchIdleList[index];
              return RecentSearchItem(
                title: searchMovie.title,
                image: searchMovie.backdropPath,
              );
            },
            separatorBuilder: (ctx, index) => SizedBox(height: 10),
            itemCount: searchMovies.searchIdleList.length,
          ),
        ),
      ],
    );
  }
}
