import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/Auth/view/widgets/auth_button_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/auth_text_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/divider_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/sign_up_button_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/social_media_buttons.dart';
import 'package:movie_app/features/home/view/screens/home_screen.dart';

class SiginScreen extends StatelessWidget {
  const SiginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
            },
            child: Text(
              'Skip',
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTextWidget(title: 'Sign In'),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: GoogleFonts.poppins(color: Colors.white54),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Password field
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(color: Colors.white54),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.poppins(color: Colors.white70),
                  ),
                ),
              ),

              SizedBox(height: 8),

              // Sign In button
              AuthButtonWidget(title: 'Sign In'),

              SizedBox(height: 20),

              // Divider with OR
              DividerWidget(),

              SizedBox(height: 20),

              // Social Login buttons
              SocialMediaButtons(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SignUpButtonWidget(
          text: "Don't you have an account? ",
          text1: 'Sign Up',
        ),
      ),
    );
  }
}
