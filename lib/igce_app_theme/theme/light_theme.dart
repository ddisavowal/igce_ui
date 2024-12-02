import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/components/components.dart';

import '../igce_app_theme.dart';
import '../theme_extensions/theme_extensions.dart';
import '../igce_color_scheme.dart';

ThemeData createLightTheme() {
  var themeData = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        // Set the predictive back transitions for Android.
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: AppColors.backgroundAppLightColor,
    dialogBackgroundColor: AppColors.backgroundWidgetLightColor,

    shadowColor: AppColors.boxShadowLightColor,
    extensions: <ThemeExtension<dynamic>>[
      IgceColorsTheme.light,
      IgceTextTheme.light
    ],

    colorScheme: IgceColorSchema.light,
    fontFamily: "Inter",
    splashColor: AppColors.animationWhiteLightColor,
    // textTheme: const MuctrTextTheme(Brightness.light),
    iconTheme: IgceIconTheme(brightness: Brightness.light),
    // iconButtonTheme: const MuctrIconButtonTheme(),
    elevatedButtonTheme: IgceElevatedButtonTheme(brightness: Brightness.light),
    filledButtonTheme: IgceFilledButtonTheme(brightness: Brightness.light),
    floatingActionButtonTheme:
        IgceFloatingButtonTheme(brightness: Brightness.light),

    cardTheme: IgceCardTheme(brightness: Brightness.light),
    listTileTheme: IgceListTileTheme(brightness: Brightness.light),
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
        // shadowColor: AppColors.boxShadowLightColor,
        // color: AppColors.defaultLightColor,
        backgroundColor: AppColors.defaultLightColor,
        foregroundColor: AppColors.textDefaultLightColor,
        centerTitle: true),

    useMaterial3: true,
  );
  return themeData;
}
