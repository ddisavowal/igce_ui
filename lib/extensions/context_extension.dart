import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/theme_extensions/text_theme.dart';
import 'package:igce_theme/igce_app_theme/theme_extensions/theme_colors.dart';

extension BuildContextExt on BuildContext {
  // AppLocalizations get localizations => AppLocalizations.of(this)!;

  // ThemeTextStyles get text => Theme.of(this).extension<ThemeTextStyles>()!;

  ThemeData get theme => Theme.of(this);
  IgceColorsTheme get colorTheme =>
      Theme.of(this).extension<IgceColorsTheme>()!;
  IgceTextTheme get textTheme => Theme.of(this).extension<IgceTextTheme>()!;
  // TextTheme get textTheme => Theme.of(this).textTheme;

  // ThemeGradients get gradient => Theme.of(this).extension<ThemeGradients>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
