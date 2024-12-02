import 'package:flutter/material.dart';

abstract class AppColors {
  // static Color defaultWhiteColor = const Color.fromRGBO(37, 82, 68, 0.98);
  // static Color defaultBlackColor = const Color.fromRGBO(29, 33, 35, 0.98);
  // static Color defaultBlackGreenColor = const Color.fromRGBO(1, 221, 153, 0.98);

  //Основные цвета
  static const Color defaultLightColor = Color(0xFFD5DFED);
  static const Color defaultDarkColor = Color(0xFF1D2123);
  static const Color primaryLightColor = Color(0xFF416A87);
  static const Color primaryDarkColor = Color(0xFF01DD99);

  //Задний фон
  static const Color backgroundAppLightColor = Color(0xFFF1F5FA);
  static const Color backgroundAppDarkColor = Color(0xFF000000);
  static const Color backgroundWidgetLightColor = Color(0xFFFFFFFF);
  static const Color backgroundWidgetDarkColor = Color(0xFF25292C);

  //Тени
  static const Color boxShadowLightColor = Color(0xFFEAECF0);
  static const Color boxShadowDarkColor = Colors.transparent;

  //Серые цвета
  static const Color greyDefaultLightColor = Color(0xFFBBBEC4);
  static const Color greyDefaultDarkColor = Color(0xFF6D7982);

  //Цвета выделения
  static const Color accentLightColor = Color(0xFFC4D0DB);
  static const Color accentDarkColor = Color(0xFF3E464C);
  static const Color accentGreyLightColor = Color(0xFFEAECF0);
  static const Color accentGreyDarkColor = Color(0xFF303539);

  //Цвета анимации
  static const Color animationMainLightColor = Color(0xFFBFC9D7);
  static const Color animationMainDarkColor = Color(0xFF292E31);
  static const Color animationPrimaryLightColor = Color(0xFF34566D);
  static const Color animationPrimaryDarkColor = Color(0xFF14A578);
  static const Color animationGreyLightColor = Color(0xFF9FA2A7);
  static const Color animationGreyDarkColor = Color(0xFF5B646B);
  static const Color animationWhiteLightColor = Color(0xFFEDF3FC);
  static const Color animationBlackDarkColor = Color(0xFF353B3F);

  //Цвета текста
  static const Color textDefaultLightColor = Color(0xFF000000);
  static const Color textDefaultDarkColor = Color(0xFFFFFFFF);
  static const Color textAccentLightColor = Color(0xFF6D7982);
  static const Color textAccentDarkColor = Color(0xFFF2F5F8);
  static const Color textLigntLightColor = Color(0xFF919FAA);
  static const Color textLightDarkColor = Color(0xFF6D7982);

  //Дополнительные цвета
  static const Color defaultErrorLightColor = Color.fromRGBO(214, 65, 65, 1);
  static const Color defaultBlueLightColor = Color.fromRGBO(53, 145, 230, 1);
  // static Color defaultMainLightColor = const Color.fromRGBO(255, 255, 255, 1);

  static const Color defaultErrorDarkColor = Color.fromRGBO(214, 65, 65, 1);
  static const Color defaultBlueDarkColor = Color.fromRGBO(53, 145, 230, 1);
  // static Color defaultMainDarkColor = const Color.fromRGBO(11, 11, 11, 1);

  //Общие цвета
  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
}
