import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/view/screens/sigin_screen.dart';
import 'package:movie_app/features/Auth/viewmodel/auth_viewmodel.dart';
import 'package:movie_app/features/profile/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<UserViewModel>(context, listen: false).fetchUserDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      try {
        await Provider.of<AuthViewModel>(context, listen: false).signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => SignInScreen()),
        );
      } catch (e) {
        throw Exception('Error:${e.toString()}');
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Consumer<UserViewModel>(
        builder: (context, userViewmodel, child) {
          return SafeArea(
            child: Column(
              children: [
                /// Top Bar with Back & Title
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                      ),

                      Text(
                        "My Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),

                /// Avatar + User Info
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  userViewmodel.user?.email ?? 'Unknown',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userViewmodel.user?.email ?? '',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),

                const SizedBox(height: 30),

                /// Glassmorphic Info Cards
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      buildInfoCard(Icons.bookmark, 'My Watchlist'),
                      buildInfoCard(Icons.download_rounded, 'Downloads'),
                      buildInfoCard(Icons.settings, 'Settings'),
                      buildInfoCard(Icons.support_agent, 'Help & Support'),

                      const SizedBox(height: 20),

                      /// Logout Card
                      GestureDetector(
                        onTap: _signOut,
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.4),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.logout, color: Colors.white),
                              SizedBox(width: 12),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInfoCard(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
        ],
      ),
    );
  }
}
