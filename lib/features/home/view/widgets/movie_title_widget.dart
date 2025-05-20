import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTitleWidget extends StatelessWidget {
  const MovieTitleWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "See All>",
            style: GoogleFonts.inter(
              color: Color(0xFFEB2F3D),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
