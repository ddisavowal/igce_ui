import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';
import 'package:igce_theme/extensions/extensions.dart';

class IgceAppTheme {
  static ThemeData get lightTheme {
    return createLightTheme();
  }

  static ThemeData get darkTheme {
    return createDarkTheme();
  }
}
