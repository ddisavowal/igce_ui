import 'package:flutter/material.dart';

import '../igce_app_theme.dart';

class IgceColorsTheme extends ThemeExtension<IgceColorsTheme> {
  final Color defaultColor;
  final Color backgroundAppColor;
  final Color backgroundWidgetColor;
  final Color defaultGreyColor;
  final Color accentColor;
  final Color accentGreyColor;
  final Color greyClickColor;
  final Color lightClickColor;
  final Color mainClickColor;
  // final Color elevatedClickColor;
  // final Color lightButtonColor;
  final Color defaultTextColor;
  final Color boxShadowColor;
  final Color defaultTransparentColor;
  final Color defaultBlackColor;
  final Color defaultWhiteColor;
  final Color defaultBlueColor;
  final Color defaultErrorColor;

  const IgceColorsTheme({
    required this.defaultColor,
    required this.backgroundAppColor,
    required this.backgroundWidgetColor,
    required this.defaultGreyColor,
    required this.accentColor,
    required this.accentGreyColor,
    required this.greyClickColor,
    required this.lightClickColor,
    required this.mainClickColor,
    required this.defaultTextColor,
    required this.boxShadowColor,
    required this.defaultTransparentColor,
    required this.defaultBlackColor,
    required this.defaultWhiteColor,
    required this.defaultBlueColor,
    required this.defaultErrorColor,
  });

  @override
  ThemeExtension<IgceColorsTheme> copyWith({
    Color? defaultColor,
    Color? backgroundAppColor,
    Color? backgroundWidgetColor,
    Color? defaultGreyColor,
    Color? accentColor,
    Color? accentGreyColor,
    Color? greyClickColor,
    Color? lightClickColor,
    Color? mainClickColor,
    Color? defaultTextColor,
    Color? boxShadowColor,
    Color? defaultTransparentColor,
    Color? defaultBlackColor,
    Color? defaultWhiteColor,
    Color? defaultBlueColor,
    Color? defaultErrorColor,
  }) {
    return IgceColorsTheme(
      defaultColor: defaultColor ?? this.defaultColor,
      backgroundAppColor: backgroundAppColor ?? this.backgroundAppColor,
      backgroundWidgetColor:
          backgroundWidgetColor ?? this.backgroundWidgetColor,
      defaultGreyColor: defaultGreyColor ?? this.defaultGreyColor,
      accentColor: accentColor ?? this.accentColor,
      accentGreyColor: accentGreyColor ?? this.accentGreyColor,
      greyClickColor: greyClickColor ?? this.greyClickColor,
      lightClickColor: lightClickColor ?? this.lightClickColor,
      mainClickColor: mainClickColor ?? this.mainClickColor,
      defaultTextColor: defaultTextColor ?? this.defaultTextColor,

      boxShadowColor: boxShadowColor ?? this.boxShadowColor,
      defaultTransparentColor:
          defaultTransparentColor ?? this.defaultTransparentColor,
      defaultBlackColor: defaultBlackColor ?? this.defaultBlackColor,
      defaultWhiteColor: defaultWhiteColor ?? this.defaultWhiteColor,
      defaultBlueColor: defaultBlueColor ?? this.defaultBlueColor,
      defaultErrorColor: defaultErrorColor ?? this.defaultErrorColor,
      // Добавлено
    );
  }

  @override
  ThemeExtension<IgceColorsTheme> lerp(
    covariant ThemeExtension<IgceColorsTheme>? other,
    double t,
  ) {
    if (other is! IgceColorsTheme) {
      return this;
    }
    return IgceColorsTheme(
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      backgroundAppColor:
          Color.lerp(backgroundAppColor, other.backgroundAppColor, t)!,
      backgroundWidgetColor:
          Color.lerp(backgroundWidgetColor, other.backgroundWidgetColor, t)!,
      defaultGreyColor:
          Color.lerp(defaultGreyColor, other.defaultGreyColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      accentGreyColor: Color.lerp(accentGreyColor, other.accentGreyColor, t)!,
      greyClickColor: Color.lerp(greyClickColor, other.greyClickColor, t)!,
      lightClickColor: Color.lerp(lightClickColor, other.lightClickColor, t)!,
      mainClickColor: Color.lerp(mainClickColor, other.mainClickColor, t)!,
      defaultTextColor:
          Color.lerp(defaultTextColor, other.defaultTextColor, t)!,
      boxShadowColor: Color.lerp(boxShadowColor, other.boxShadowColor, t)!,
      defaultTransparentColor: Color.lerp(
          defaultTransparentColor, other.defaultTransparentColor, t)!,
      defaultBlackColor:
          Color.lerp(defaultBlackColor, other.defaultBlackColor, t)!,
      defaultWhiteColor:
          Color.lerp(defaultWhiteColor, other.defaultWhiteColor, t)!,
      defaultBlueColor:
          Color.lerp(defaultBlueColor, other.defaultBlueColor, t)!,
      defaultErrorColor:
          Color.lerp(defaultErrorColor, other.defaultErrorColor, t)!,
    );
  }

  static get light => IgceColorsTheme(
        defaultColor: AppColors.defaultLightColor,
        backgroundAppColor: AppColors.backgroundAppLightColor,
        backgroundWidgetColor: AppColors.backgroundWidgetLightColor,
        defaultGreyColor: AppColors.greyDefaultLightColor,
        accentColor: AppColors.accentLightColor,
        accentGreyColor: AppColors.accentGreyLightColor,
        greyClickColor: AppColors.animationGreyLightColor,
        lightClickColor: AppColors.animationWhiteLightColor,
        mainClickColor: AppColors.animationMainLightColor,
        defaultTextColor: AppColors.black,
        boxShadowColor: AppColors.accentLightColor,
        defaultTransparentColor: AppColors.transparent,
        defaultBlackColor: AppColors.black,
        defaultWhiteColor: AppColors.white,
        defaultBlueColor: AppColors.defaultBlueLightColor,
        defaultErrorColor: AppColors.defaultErrorLightColor,
      );

  static get dark => IgceColorsTheme(
        defaultColor: AppColors.defaultDarkColor,
        backgroundAppColor: AppColors.backgroundAppDarkColor,
        backgroundWidgetColor: AppColors.backgroundWidgetDarkColor,
        defaultGreyColor: AppColors.greyDefaultDarkColor,
        accentColor: AppColors.accentDarkColor,
        accentGreyColor: AppColors.accentGreyDarkColor,
        greyClickColor: AppColors.animationGreyDarkColor,
        lightClickColor: AppColors.animationBlackDarkColor,
        mainClickColor: AppColors.animationMainDarkColor,
        defaultTextColor: AppColors.white,
        boxShadowColor: AppColors.transparent,
        defaultTransparentColor: AppColors.transparent,
        defaultBlackColor: AppColors.black,
        defaultWhiteColor: AppColors.white,
        defaultBlueColor: AppColors.defaultBlueDarkColor,
        defaultErrorColor: AppColors.defaultErrorDarkColor,
      );
}
