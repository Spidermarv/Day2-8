import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'blocs/servicicon.dart';
import 'blocs/drawer.dart';
import 'blocs/Drawerit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _currentIndex = 0; // Default index for home screen
  final _pageTitles = ['Home', 'Stats', 'Transactions', 'Settings'];
  late AnimationController _fabAnimationController;
  late Animation<double> _fabAnimation;
  late AnimationController _hideBottomBarAnimationController;

  final List<IconData> _iconList = [
    Icons.home,
    Icons.pie_chart,
    Icons.receipt,
    Icons.settings,
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fabAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fabAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {
            // Handle notifications screen logic
          },
        ),
        title: Text(
          'Welcome Billy',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$3,456.88',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Saved this month: \$482',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceIcon(
                  icon: Icons.account_balance_wallet,
                  label: 'Top up',
                  onPressed: () {},
                ),
                ServiceIcon(
                  icon: Icons.send,
                  label: 'Send',
                  onPressed: () {},
                ),
                ServiceIcon(
                  icon: Icons.receipt_long,
                  label: 'Transactions',
                  onPressed: () {},
                ),
                ServiceIcon(
                  icon: Icons.more_horiz,
                  label: 'Other',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.menu_book_outlined, color: Colors.white),
        onPressed: () {
          // Handle FAB click event
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: _iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.teal : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_iconList[index], size: 24, color: color),
              const SizedBox(height: 4),
              Text(
                _pageTitles[index],
                style: TextStyle(color: color, fontSize: 12),
              ),
            ],
          );
        },
        backgroundColor: Colors.grey[850],
        activeIndex: _currentIndex,
        splashColor: Colors.tealAccent,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    _hideBottomBarAnimationController.dispose();
    super.dispose();
  }
}
