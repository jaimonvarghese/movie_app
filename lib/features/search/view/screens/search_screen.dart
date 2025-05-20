import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/search/view/widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/Expand_right_light.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CupertinoSearchTextField(
                      padding: EdgeInsets.all(15),
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(30),
                      backgroundColor: Color(0xFF1E1E1E),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.xmark_circle,
                        color: Colors.grey,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              //Expanded(child: SearchIdle()),
              Expanded(child: SearchResult()),
            ],
          ),
        ),
      ),
    );
  }
}
