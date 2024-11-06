
import 'package:flutter/material.dart';

class CustomColorsTheme extends ThemeExtension<CustomColorsTheme> {
  final Color? activeNavigationBarColor;
  final Color? notActiveNavigationBarColor;
  final Color? bottomNavigationBarBackgroundColor;

  CustomColorsTheme({
    this.activeNavigationBarColor,
    this.notActiveNavigationBarColor,
    this.bottomNavigationBarBackgroundColor,
  });

  @override
  CustomColorsTheme copyWith({
    Color? activeNavigationBarColor,
    Color? notActiveNavigationBarColor,
    Color? bottomNavigationBarBackgroundColor,
  }) {
    return CustomColorsTheme(
      activeNavigationBarColor: activeNavigationBarColor ?? this.activeNavigationBarColor,
      notActiveNavigationBarColor: notActiveNavigationBarColor ?? this.notActiveNavigationBarColor,
      bottomNavigationBarBackgroundColor:
      bottomNavigationBarBackgroundColor ?? this.bottomNavigationBarBackgroundColor,
    );
  }

  @override
  CustomColorsTheme lerp(ThemeExtension<CustomColorsTheme>? other, double t) {
    if (other is! CustomColorsTheme) {
      return this;
    }
    return CustomColorsTheme(
      activeNavigationBarColor:
      Color.lerp(activeNavigationBarColor, other.activeNavigationBarColor, t),
      notActiveNavigationBarColor:
      Color.lerp(notActiveNavigationBarColor, other.notActiveNavigationBarColor, t),
      bottomNavigationBarBackgroundColor: Color.lerp(
          bottomNavigationBarBackgroundColor, other.bottomNavigationBarBackgroundColor, t),
    );
  }
}
