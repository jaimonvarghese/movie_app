import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/profile/view/screens/user_profile_screen.dart';
import 'package:movie_app/features/search/view/screens/search_screen.dart';

class QuickActionSectionWidget extends StatelessWidget {
  const QuickActionSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey, Sarthak',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Karangamal>',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFFEB2F3D),
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: Image.asset('assets/images/Search_light.png')),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => UserProfileScreen()));
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: Image.asset('assets/images/User_light.png')),
          ),
        ),
      ],
    );
  }
}
