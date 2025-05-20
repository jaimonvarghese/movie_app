import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/movie_card_widget.dart';
import 'package:movie_app/features/search/view/widgets/search_text_title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Search Results'),
        SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.4,
            children: List.generate(20, (index) {
              return MovieCardWidget(image: '');
            }),
          ),
        ),
      ],
    );
  }
}
