import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceCardTheme extends CardTheme {
  final Brightness brightness;
  IgceCardTheme({required this.brightness})
      : super(
            color: brightness == Brightness.light
                ? AppColors.backgroundAppLightColor
                : AppColors.backgroundAppDarkColor,
            shadowColor: brightness == Brightness.light
                ? AppColors.greyDefaultLightColor
                : AppColors.greyDefaultDarkColor,
            // surfaceTintColor: AppColors.defaultTransparentColor,
            elevation: 1.4,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)));
}
