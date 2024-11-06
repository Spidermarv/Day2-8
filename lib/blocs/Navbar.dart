import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expense/theme/customcolorstheme.dart';

class NavBarBlock extends StatefulWidget {
  final List<IconData> iconList;
  final ValueChanged<int> onItemSelected;
  final int initialIndex;

  NavBarBlock({
    Key? key,
    required this.iconList,
    required this.onItemSelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _NavBarBlockState createState() => _NavBarBlockState();
}

class _NavBarBlockState extends State<NavBarBlock> with TickerProviderStateMixin {
  late int _bottomNavIndex;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  @override
  void initState() {
    super.initState();
    _bottomNavIndex = widget.initialIndex;

    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(borderRadiusCurve);

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  @override
  void dispose() {
    _borderRadiusAnimationController.dispose();
    _hideBottomBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return AnimatedBottomNavigationBar.builder(
      itemCount: widget.iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive
            ? colors.activeNavigationBarColor
            : colors.notActiveNavigationBarColor;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.iconList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                "Tab $index",
                maxLines: 1,
                style: TextStyle(color: color),
              ),
            ),
          ],
        );
      },
      backgroundColor: colors.bottomNavigationBarBackgroundColor,
      activeIndex: _bottomNavIndex,
      splashColor: colors.activeNavigationBarColor,
      notchAndCornersAnimation: borderRadiusAnimation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        setState(() {
          _bottomNavIndex = index;
        });
        widget.onItemSelected(index);
      },
      hideAnimationController: _hideBottomBarAnimationController,
      shadow: BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: colors.activeNavigationBarColor ?? Colors.teal.shade900,
      ),
    );
  }
}
