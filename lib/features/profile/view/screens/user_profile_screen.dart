import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Match dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Navigate to Edit Profile Screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your image
            ),
            const SizedBox(height: 16),

            // Username
            Text(
              'Jaimon Varghese',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // Email
            Text(
              'jaimon@example.com',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 24),

            // Profile Info Cards
            buildInfoTile(Icons.movie, 'My Watchlist'),
            buildInfoTile(Icons.download, 'Downloads'),
            buildInfoTile(Icons.settings, 'Settings'),
            buildInfoTile(Icons.logout, 'Log Out', onTap: () {
              // Sign out logic here
            }),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(title, style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
        ),
      ),
    );
  }
}
