import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/view/screens/sigin_screen.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({
    super.key,
    required this.text,
    required this.text1,
  });
  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => SignInScreen()));
          },
          child: Text(
            text1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
