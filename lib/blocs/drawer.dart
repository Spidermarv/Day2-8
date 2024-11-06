import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Add padding to ensure the header is aligned properly
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'John Doe', // Replace with a dynamic value if needed
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: const Text(
              'john.doe@example.com', // Replace with a dynamic value if needed
              style: TextStyle(color: Colors.white70),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.deepPurple, // Changed from `deeppurple` to `deepPurple`
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart, color: Colors.deepPurple),
            title: const Text('Your Expenses', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              // Navigate to the appropriate screen
              Navigator.pop(context); // Closes the drawer
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Expenses')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              // Handle logout functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logging out')),
              );
            },
          ),
        ],
      ),
    );
  }
}
