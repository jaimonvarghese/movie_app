import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _googleSignIn() async {
      try {
        await Provider.of<AuthViewModel>(
          context,
          listen: false,
        ).signInWithGoogle();
      } catch (e) {
        throw Exception('Error: ${e.toString()}');
      }
    }

    return _buildSocialButton(Icons.g_mobiledata, Colors.white, _googleSignIn);
  }

  Widget _buildSocialButton(
    IconData icon,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: Color(0xFF2C2C2C),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}
