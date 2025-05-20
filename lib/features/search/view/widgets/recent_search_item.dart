import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentSearchItem extends StatelessWidget {
  const RecentSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://media.themoviedb.org/t/p/w500_and_h282_face/7z2lSLmiJ5jNeYCoXmton86BapN.jpg',
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        
        Expanded(
          child: Text(
            'Movie Name',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
