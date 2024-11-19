import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceIconTheme extends IconThemeData {
  final Brightness brightness;

  IgceIconTheme({
    required this.brightness,
    double? size,
    double? opacity,
  }) : super(
          color: brightness == Brightness.light
              ? AppColors.defaultLightColor
              : AppColors.defaultDarkColor,
          size: size ?? 24.0, // Размер по умолчанию
          opacity: opacity ?? 1.0, // Прозрачность по умолчанию
        );
}
