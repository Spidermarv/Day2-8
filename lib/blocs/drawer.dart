import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white60,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Billy White',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: const Text(
              'billy.white@example.com',
              style: TextStyle(color: Colors.white70),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white10,
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.teal[900],
            ),
          ),
          ListTile(
            leading: Icon(Icons.pie_chart, color: Colors.teal[900]),
            title: const Text('Your Expenses', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Expenses')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.teal[900]),
            title: const Text('Analytics', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Analytics')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.teal[900]),
            title: const Text('Cards', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Cards')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.teal[900]),
            title: const Text('Transaction History', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Transaction History')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.teal[900]),
            title: const Text('Settings', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Settings')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.blueAccent),
            title: const Text('Help & Support', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Help & Support')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.blueAccent),
            title: const Text('About', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to About')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout', style: TextStyle(fontSize: 16.0)),
            onTap: () {
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
