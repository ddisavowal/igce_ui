import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceFilledButtonTheme extends FilledButtonThemeData {
  final Brightness brightness;

  IgceFilledButtonTheme({
    required this.brightness,
  }) : super(
            style: FilledButton.styleFrom(
          backgroundColor: brightness == Brightness.light
              ? AppColors.defaultLightColor
              : AppColors.defaultDarkAnotherColor,
          disabledBackgroundColor: brightness == Brightness.light
              // ? AppColors.defaultLightColor.withOpacity(0.09)
              ? AppColors.accentGreyLightColor
              : AppColors.accentGreyDarkColor,
          // : AppColors.defaultDarkColor.withOpacity(0.09),
          foregroundColor: brightness == Brightness.light
              ? AppColors.white
              : AppColors.defaultDarkColor,
          disabledForegroundColor: brightness == Brightness.light
              ? AppColors.black.withOpacity(0.4)
              : AppColors.white.withOpacity(0.4),
          splashFactory: InkSplash.splashFactory,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return brightness == Brightness.light
                    ? AppColors.animationMainLightColor
                    : AppColors.animationMainDarkColor;
              }
              return null; // Никакого эффекта в остальных состояниях
            },
          ),
          elevation: WidgetStateProperty.resolveWith<double>(
            (Set<WidgetState> states) {
              // if (states.contains(WidgetState.pressed)) {
              //   return 0.0; // Высота тени при нажатии
              // }
              return 0.0; // Высота тени в остальных состояниях
            },
          ),
        ));
}
