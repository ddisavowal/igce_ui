import 'package:flutter/material.dart';

import '../igce_app_theme.dart';

class IgceColorsTheme extends ThemeExtension<IgceColorsTheme> {
  final Color defaultColor;
  final Color primaryColor;
  final Color backgroundAppColor;
  final Color backgroundWidgetColor;
  final Color boxShadowColor;

  final Color defaultGreyColor;
  final Color accentColor;
  final Color accentGreyColor;

  final Color mainClickColor;
  final Color primaryClickColor;
  final Color greyClickColor;
  final Color lightClickColor;

  final Color defaultTextColor;
  final Color accentTextColor;
  final Color lightTextColor;

  final Color defaultErrorColor;
  final Color defaultBlueColor;

  final Color defaultWhiteColor;
  final Color defaultBlackColor;
  final Color defaultTransparentColor;

  const IgceColorsTheme({
    required this.defaultColor,
    required this.primaryColor,
    required this.backgroundAppColor,
    required this.backgroundWidgetColor,
    required this.boxShadowColor,
    required this.defaultGreyColor,
    required this.accentColor,
    required this.accentGreyColor,
    required this.mainClickColor,
    required this.primaryClickColor,
    required this.greyClickColor,
    required this.lightClickColor,
    required this.defaultTextColor,
    required this.accentTextColor,
    required this.lightTextColor,
    required this.defaultErrorColor,
    required this.defaultBlueColor,
    required this.defaultWhiteColor,
    required this.defaultBlackColor,
    required this.defaultTransparentColor,
  });

  @override
  ThemeExtension<IgceColorsTheme> copyWith({
    Color? defaultColor,
    Color? primaryColor,
    Color? backgroundAppColor,
    Color? backgroundWidgetColor,
    Color? boxShadowColor,
    Color? defaultGreyColor,
    Color? accentColor,
    Color? accentGreyColor,
    Color? mainClickColor,
    Color? primaryClickColor,
    Color? greyClickColor,
    Color? lightClickColor,
    Color? defaultTextColor,
    Color? accentTextColor,
    Color? lightTextColor,
    Color? defaultErrorColor,
    Color? defaultBlueColor,
    Color? defaultWhiteColor,
    Color? defaultBlackColor,
    Color? defaultTransparentColor,
  }) {
    return IgceColorsTheme(
      defaultColor: defaultColor ?? this.defaultColor,
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundAppColor: backgroundAppColor ?? this.backgroundAppColor,
      backgroundWidgetColor:
          backgroundWidgetColor ?? this.backgroundWidgetColor,
      boxShadowColor: boxShadowColor ?? this.boxShadowColor,
      defaultGreyColor: defaultGreyColor ?? this.defaultGreyColor,
      accentColor: accentColor ?? this.accentColor,
      accentGreyColor: accentGreyColor ?? this.accentGreyColor,
      mainClickColor: mainClickColor ?? this.mainClickColor,
      primaryClickColor: primaryClickColor ?? this.primaryClickColor,
      greyClickColor: greyClickColor ?? this.greyClickColor,
      lightClickColor: lightClickColor ?? this.lightClickColor,
      defaultTextColor: defaultTextColor ?? this.defaultTextColor,
      accentTextColor: accentTextColor ?? this.accentTextColor,
      lightTextColor: lightTextColor ?? this.lightTextColor,
      defaultErrorColor: defaultErrorColor ?? this.defaultErrorColor,
      defaultBlueColor: defaultBlueColor ?? this.defaultBlueColor,
      defaultWhiteColor: defaultWhiteColor ?? this.defaultWhiteColor,
      defaultBlackColor: defaultBlackColor ?? this.defaultBlackColor,
      defaultTransparentColor:
          defaultTransparentColor ?? this.defaultTransparentColor,
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
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      backgroundAppColor:
          Color.lerp(backgroundAppColor, other.backgroundAppColor, t)!,
      backgroundWidgetColor:
          Color.lerp(backgroundWidgetColor, other.backgroundWidgetColor, t)!,
      boxShadowColor: Color.lerp(boxShadowColor, other.boxShadowColor, t)!,
      defaultGreyColor:
          Color.lerp(defaultGreyColor, other.defaultGreyColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      accentGreyColor: Color.lerp(accentGreyColor, other.accentGreyColor, t)!,
      mainClickColor: Color.lerp(mainClickColor, other.mainClickColor, t)!,
      primaryClickColor:
          Color.lerp(primaryClickColor, other.primaryClickColor, t)!,
      greyClickColor: Color.lerp(greyClickColor, other.greyClickColor, t)!,
      lightClickColor: Color.lerp(lightClickColor, other.lightClickColor, t)!,
      defaultTextColor:
          Color.lerp(defaultTextColor, other.defaultTextColor, t)!,
      accentTextColor: Color.lerp(accentTextColor, other.accentTextColor, t)!,
      lightTextColor: Color.lerp(lightTextColor, other.lightTextColor, t)!,
      defaultErrorColor:
          Color.lerp(defaultErrorColor, other.defaultErrorColor, t)!,
      defaultBlueColor:
          Color.lerp(defaultBlueColor, other.defaultBlueColor, t)!,
      defaultWhiteColor:
          Color.lerp(defaultWhiteColor, other.defaultWhiteColor, t)!,
      defaultBlackColor:
          Color.lerp(defaultBlackColor, other.defaultBlackColor, t)!,
      defaultTransparentColor: Color.lerp(
          defaultTransparentColor, other.defaultTransparentColor, t)!,
    );
  }

  static const light = IgceColorsTheme(
    defaultColor: AppColors.defaultLightColor,
    primaryColor: AppColors.primaryLightColor,
    backgroundAppColor: AppColors.backgroundAppLightColor,
    backgroundWidgetColor: AppColors.backgroundWidgetLightColor,
    boxShadowColor: AppColors.boxShadowLightColor,
    defaultGreyColor: AppColors.greyDefaultLightColor,
    accentColor: AppColors.accentLightColor,
    accentGreyColor: AppColors.accentGreyLightColor,
    mainClickColor: AppColors.animationMainLightColor,
    primaryClickColor: AppColors.animationPrimaryLightColor,
    greyClickColor: AppColors.animationGreyLightColor,
    lightClickColor: AppColors.animationWhiteLightColor,
    defaultTextColor: AppColors.textDefaultLightColor,
    accentTextColor: AppColors.textAccentLightColor,
    lightTextColor: AppColors.textLigntLightColor,
    defaultErrorColor: AppColors.defaultErrorLightColor,
    defaultBlueColor: AppColors.defaultBlueLightColor,
    defaultWhiteColor: AppColors.white,
    defaultBlackColor: AppColors.black,
    defaultTransparentColor: AppColors.transparent,
  );

  static const dark = IgceColorsTheme(
    defaultColor: AppColors.defaultDarkColor,
    primaryColor: AppColors.primaryDarkColor,
    backgroundAppColor: AppColors.backgroundAppDarkColor,
    backgroundWidgetColor: AppColors.backgroundWidgetDarkColor,
    boxShadowColor: AppColors.boxShadowDarkColor,
    defaultGreyColor: AppColors.greyDefaultDarkColor,
    accentColor: AppColors.accentDarkColor,
    accentGreyColor: AppColors.accentGreyDarkColor,
    mainClickColor: AppColors.animationMainDarkColor,
    primaryClickColor: AppColors.animationPrimaryDarkColor,
    greyClickColor: AppColors.animationGreyDarkColor,
    lightClickColor: AppColors.animationBlackDarkColor,
    defaultTextColor: AppColors.textDefaultDarkColor,
    accentTextColor: AppColors.textAccentDarkColor,
    lightTextColor: AppColors.textLightDarkColor,
    defaultErrorColor: AppColors.defaultErrorDarkColor,
    defaultBlueColor: AppColors.defaultBlueDarkColor,
    defaultWhiteColor: AppColors.white,
    defaultBlackColor: AppColors.black,
    defaultTransparentColor: AppColors.transparent,
  );
}
