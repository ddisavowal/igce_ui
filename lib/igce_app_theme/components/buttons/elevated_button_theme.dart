import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceElevatedButtonTheme extends ElevatedButtonThemeData {
  final Brightness brightness;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? foregroundColor;

  IgceElevatedButtonTheme({
    required this.brightness,
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? foregroundColor,
  })  : backgroundColor = AppColors.transparent
        // backgroundColor ??
        //           (brightness == Brightness.light
        //               ? AppColors.elevatedButtonLightColor
        //               : AppColors.elevatedButtonDarkColor)
        ,
        disabledBackgroundColor = disabledBackgroundColor ??
            (brightness == Brightness.light
                ? AppColors.accentLightColor
                : AppColors.accentDarkColor),
        disabledForegroundColor = disabledForegroundColor ??
            (brightness == Brightness.light
                ? AppColors.greyDefaultLightColor
                : AppColors.greyDefaultDarkColor),
        foregroundColor = foregroundColor ??
            (brightness == Brightness.light
                ? AppColors.defaultLightColor
                : AppColors.defaultDarkColor),
        super(
            style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.transparent,
          disabledBackgroundColor: AppColors.transparent,
          foregroundColor: foregroundColor,
          disabledForegroundColor: disabledForegroundColor,
          splashFactory: InkSplash.splashFactory,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return brightness == Brightness.light
                    ? AppColors.animationWhiteLightColor
                    : AppColors.animationBlackDarkColor;
                // ? AppColors.white
                // : AppColors.black;
              }
              return null; // Никакого эффекта в остальных состояниях
            },
          ),
          elevation: WidgetStateProperty.resolveWith<double>(
            (Set<WidgetState> states) {
              // if (states.contains(WidgetState.pressed)) {
              //   return 3.0; // Высота тени при нажатии
              // }
              return 0.0; // Высота тени в остальных состояниях
            },
          ),
          side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide(
                    width: 1.6,
                    color: brightness == Brightness.light
                        ? AppColors.greyDefaultLightColor
                        : AppColors.greyDefaultDarkColor);
              }
              return BorderSide(
                  width: 1.6,
                  color: brightness == Brightness.light
                      ? AppColors.defaultLightColor
                      : AppColors.defaultDarkColor);
            },
          ),
        ));
}
