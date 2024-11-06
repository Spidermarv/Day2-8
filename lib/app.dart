import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Available Balance', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const AppDrawer(), // Drawer on the right side
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$3,456.88',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Saved this month: \$482',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Services Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceIcon(
                  icon: Icons.account_balance_wallet,
                  label: 'Top up',
                  onPressed: () {
                    // Add navigation logic
                  },
                ),
                ServiceIcon(
                  icon: Icons.send,
                  label: 'Send',
                  onPressed: () {
                    // Add navigation logic
                  },
                ),
                ServiceIcon(
                  icon: Icons.receipt_long,
                  label: 'Transactions',
                  onPressed: () {
                    // Add navigation logic
                  },
                ),
                ServiceIcon(
                  icon: Icons.more_horiz,
                  label: 'Other',
                  onPressed: () {
                    // Add navigation logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Transaction List
            Expanded(
              child: ListView(
                children: const [
                  TransactionCard(
                    title: 'Amazon',
                    time: 'July 11, 2023',
                    amount: '-\$76.99',
                  ),
                  TransactionCard(
                    title: 'PayPal',
                    time: 'July 8, 2023',
                    amount: '-\$150.00',
                  ),
                  TransactionCard(
                    title: 'McDonald\'s',
                    time: 'July 6, 2023',
                    amount: '-\$8.75',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.teal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: ClipOval(
                    child: RandomAvatar(
                      DateTime.now().toIso8601String(),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Kristin Watson',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          DrawerItem(
            icon: Icons.dashboard,
            label: 'Dashboard',
            onTap: () {
              Navigator.pop(context);
              // Navigate to dashboard
            },
          ),
          DrawerItem(
            icon: Icons.account_balance_wallet,
            label: 'My Wallet',
            onTap: () {
              Navigator.pop(context);
              // Navigate to wallet
            },
          ),
          DrawerItem(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings
            },
          ),
          DrawerItem(
            icon: Icons.logout,
            label: 'Logout',
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ServiceIcon({super.key, required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String title;
  final String time;
  final String amount;

  const TransactionCard({super.key, required this.title, required this.time, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
                Text(time, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
            Text(amount, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DrawerItem({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
