import 'package:flutter/material.dart';
import 'package:movie_app/features/search/view/widgets/recent_search_item.dart';
import 'package:movie_app/features/search/view/widgets/search_text_title.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Recent Search',),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) => RecentSearchItem(),
            separatorBuilder: (ctx, index) => SizedBox(height: 10),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}