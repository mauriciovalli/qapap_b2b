import 'package:flutter/material.dart';
import 'package:qapaq_b2b/presentation/common/adaptive.dart';

// ignore: non_constant_identifier_names
final ThemeData CompanyThemeData = new ThemeData(
  primarySwatch: CompanyColors.red,
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  accentColor: CompanyColors.red[700],
  accentColorBrightness: Brightness.light,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    subtitle2: TextStyle(fontSize: 12),
  ),
  iconTheme: IconThemeData(color: Colors.white),
);

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class

  //static const int _redPrimaryValue = 0xFFE72929;
  static const int _redPrimaryValue = 0xFFEE4135;

  static const MaterialColor red = const MaterialColor(
    _redPrimaryValue,
    const <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(_redPrimaryValue),
      600: Color(0xFFE53935),
      //700: Color(0xFFDF0010),
      700: Color(0xFFE81211),
      800: Color(0xFFD81010),
      900: Color(0xFFB12E25),
    },
  );
}


class ThemeConfig {
  final double _appPaddingLargeW = 120.0;
  final double _appPaddingLargeM = 12.0;

  final double _appPaddingSmallW = 20.0;
  final double _appPaddingSmallM = 4.0;

  final double _appPaddingVerticalW = 20.0;
  final double _appPaddingVerticalM = 10.0;

  final double _titleFontSizeW = 18.0;
  final double _titleFontSizeM = 12.0;

  final double _subTitleFontSizeW = 14.0;
  final double _subTitleFontSizeM = 8.0;

  bool isDesktop;
  bool isSmallDesktop;
  double appPaddingHorizontalLarge;
  double appPaddingHorizontalSmall;
  double appPaddingVertical;
  double subTitleFontSize;
  double titleFontSize;

  ThemeConfig(BuildContext context) {
    isDesktop = isDisplayDesktop(context);
    isSmallDesktop = isDisplaySmallDesktop(context);

    appPaddingHorizontalLarge =
        isDesktop && !isSmallDesktop ? _appPaddingLargeW : _appPaddingLargeM;
    appPaddingHorizontalSmall =
        isDesktop && !isSmallDesktop ? _appPaddingSmallW : _appPaddingSmallM;
    appPaddingVertical = isDesktop && !isSmallDesktop
        ? _appPaddingVerticalW
        : _appPaddingVerticalM;
    subTitleFontSize =
        isDesktop && !isSmallDesktop ? _subTitleFontSizeW : _subTitleFontSizeM;

    titleFontSize =
        isDesktop && !isSmallDesktop ? _titleFontSizeW : _titleFontSizeM;
  }

  static ThemeConfig instance(BuildContext context) {
      return ThemeConfig(context);
  }
}
