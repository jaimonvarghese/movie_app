import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
