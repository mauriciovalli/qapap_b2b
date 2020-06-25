import 'package:flutter/material.dart';
import 'package:qapaq_b2b/presentation/common/adaptive.dart';

// ignore: non_constant_identifier_names
final ThemeData CompanyThemeData = new ThemeData(
  primarySwatch: CompanyColors.red,
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  accentColor: CompanyColors.red[900],
  accentColorBrightness: Brightness.light,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
//    subtitle2: TextStyle(color: Colors.white),
  ),
  iconTheme: IconThemeData(color: Colors.white),
);

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class

  static const int _redPrimaryValue = 0xFFA12121;

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
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
}


class ThemeConfig {
  final double textFieldHeight = 60.0;
  final double appPaddingLargeW = 120.0;
  final double appPaddingLargeM = 12.0;

  final double appPaddingSmallW = 20.0;
  final double appPaddingSmallM = 4.0;

  final double appPaddingVerticalW = 20.0;
  final double appPaddingVerticalM = 10.0;

  final double titleFontSizeW = 18.0;
  final double titleFontSizeM = 12.0;

  final double subTitleFontSizeW = 14.0;
  final double subTitleFontSizeM = 8.0;

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
        isDesktop && !isSmallDesktop ? appPaddingLargeW : appPaddingLargeM;
    appPaddingHorizontalSmall =
        isDesktop && !isSmallDesktop ? appPaddingSmallW : appPaddingSmallM;
    appPaddingVertical = isDesktop && !isSmallDesktop
        ? appPaddingVerticalW
        : appPaddingVerticalM;
    subTitleFontSize =
        isDesktop && !isSmallDesktop ? subTitleFontSizeW : subTitleFontSizeM;

    titleFontSize =
        isDesktop && !isSmallDesktop ? titleFontSizeW : titleFontSizeM;
  }

  static ThemeConfig instance(BuildContext context) {
      return ThemeConfig(context);
  }
}
