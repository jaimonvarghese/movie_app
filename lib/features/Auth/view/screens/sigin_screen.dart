import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/Auth/view/widgets/auth_button_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/auth_text_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/divider_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/sign_up_button_widget.dart';
import 'package:movie_app/features/Auth/view/widgets/social_media_buttons.dart';
import 'package:movie_app/features/Auth/viewmodel/auth_viewmodel.dart';
import 'package:movie_app/features/home/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).signInWithEmail(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      throw Exception('Please enter email ');
    }

    try {
      await Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).resetPassword(email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password Reset link Send to Your Mail.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
            child: Text(
              'Skip',
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const AuthTextWidget(title: 'Sign In'),
              const SizedBox(height: 30),

              // Email Field
              _buildTextField(controller: _emailController, hint: 'E-mail'),
              const SizedBox(height: 16),

              // Password Field
              _buildTextField(
                controller: _passwordController,
                hint: 'Password',
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _resetPassword,
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.poppins(color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Sign In Button
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : AuthButtonWidget(title: 'Sign In', onPressed: _signIn),

              const SizedBox(height: 20),
              const DividerWidget(),
              const SizedBox(height: 20),
              const SocialMediaButtons(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SignUpButtonWidget(
          text: "Don't have an account? ",
          text1: 'Sign Up',
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
