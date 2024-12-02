import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/components/components.dart';

import '../igce_app_theme.dart';
import '../theme_extensions/theme_extensions.dart';
import '../igce_color_scheme.dart';

ThemeData createDarkTheme() {
  var themeData = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        // Set the predictive back transitions for Android.
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: AppColors.backgroundAppDarkColor,
    dialogBackgroundColor: AppColors.backgroundWidgetDarkColor,

    shadowColor: AppColors.boxShadowDarkColor,
    extensions: <ThemeExtension<dynamic>>[
      IgceColorsTheme.dark,
      IgceTextTheme.dark
    ],

    colorScheme: IgceColorSchema.dark,
    fontFamily: "Inter",
    splashColor: AppColors.animationBlackDarkColor,
    // textTheme: const MuctrTextTheme(Brightness.light),
    iconTheme: IgceIconTheme(brightness: Brightness.dark),
    // iconButtonTheme: const IgceIconButtonTheme(),
    elevatedButtonTheme: IgceElevatedButtonTheme(brightness: Brightness.dark),
    filledButtonTheme: IgceFilledButtonTheme(brightness: Brightness.dark),
    floatingActionButtonTheme:
        IgceFloatingButtonTheme(brightness: Brightness.dark),

    cardTheme: IgceCardTheme(brightness: Brightness.dark),
    listTileTheme: IgceListTileTheme(brightness: Brightness.dark),
    // popupMenuTheme: const MuctrPopupMenuTheme(),
    // expansionTileTheme: MuctrExpansionTileTheme(brightness: Brightness.light),
    // checkboxTheme: MuctrCheckboxTheme(),
    // datePickerTheme: const MuctrDatePickerTheme(),
    // snackBarTheme: const MuctrSnacBartheme(),
    // progressIndicatorTheme: const MuctrProgressIndicatorTheme(),
    // drawerTheme: const MuctrDrawerTheme(),
    // timePickerTheme: MuctrTimePickerTheme(brightness: Brightness.light),
    // dialogTheme: MuctrDialogTheme(brightness: Brightness.light),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        // shadowColor: AppColors.boxShadowDarkColor,
        // color: AppColors.defaultDarkAnotherColor,
        backgroundColor: AppColors.defaultDarkColor,
        foregroundColor: AppColors.textDefaultDarkColor,
        centerTitle: true),

    useMaterial3: true,
  );
  return themeData;
}
