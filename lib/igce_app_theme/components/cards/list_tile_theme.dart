import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceListTileTheme extends ListTileThemeData {
  final Brightness brightness;

  IgceListTileTheme({
    required this.brightness,
    Color? iconColor,
    Color? textColor,
    ListTileTitleAlignment? titleAlignment,
  }) : super(
          iconColor: brightness == Brightness.light
              ? AppColors.defaultLightColor
              : AppColors.defaultDarkColor,
          textColor: textColor ??
              (brightness == Brightness.light
                  ? AppColors.black
                  : AppColors.white),
          titleAlignment: titleAlignment ?? ListTileTitleAlignment.center,
        );
}
