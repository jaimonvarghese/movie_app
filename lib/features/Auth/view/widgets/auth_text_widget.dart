
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),
    );
  }
}
