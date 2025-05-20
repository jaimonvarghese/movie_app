import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(Icons.facebook, Colors.white),
        _buildSocialButton(Icons.g_mobiledata, Colors.white),
        _buildSocialButton(Icons.apple, Colors.white),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, Color iconColor) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: iconColor, size: 28),
    );
  }
}
