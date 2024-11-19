import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceFloatingButtonTheme extends FloatingActionButtonThemeData {
  final Brightness brightness;

  IgceFloatingButtonTheme({
    required this.brightness,
  }) : super(
          backgroundColor: (brightness == Brightness.light
              ? AppColors.defaultLightColor
              : AppColors.defaultDarkAnotherColor),
          foregroundColor: brightness == Brightness.light
              ? AppColors.white
              : AppColors.defaultDarkColor,
          splashColor: (brightness == Brightness.light
              ? AppColors.animationMainLightColor
              : AppColors.animationBlackDarkColor),
          hoverColor: AppColors.transparent,
          elevation: 0.0,
        );

  ButtonStyle getOverlayButtonStyle() {
    return ElevatedButton.styleFrom().copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return brightness == Brightness.light
                ? AppColors.animationMainLightColor
                : AppColors.animationMainDarkColor;
          }
          // if (states.contains(WidgetState.hovered)) {
          //   return AppColors.defaultDarkBlueColor.withOpacity(0.04);
          // }
          return null;
        },
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return 0.0;
          }
          return 0.0;
        },
      ),
    );
  }
}
