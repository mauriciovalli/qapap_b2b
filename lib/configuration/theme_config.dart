import 'package:flutter/material.dart';
import 'package:qapaq_b2b/layout/adaptive.dart';

class ThemeConfig {
  final double textFieldHeight = 60.0;
  final double appPaddingLargeW = 120.0;
  final double appPaddingLargeM = 24.0;

  final double appPaddingSmallW = 20.0;
  final double appPaddingSmallM = 10.0;

  final double appPaddingVerticalW = 20.0;
  final double appPaddingVerticalM = 10.0;

  final double titleFontSizeW = 20.0;
  final double titleFontSizeM = 10.0;

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
}
