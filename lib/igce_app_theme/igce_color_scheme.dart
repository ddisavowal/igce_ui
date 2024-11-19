import 'package:flutter/material.dart';
import 'package:igce_theme/igce_app_theme/igce_app_theme.dart';

class IgceColorSchema extends ColorScheme {
  @override
  Brightness get brightness;

  @override
  Color get primary;

  @override
  Color get onPrimary;

  @override
  Color get secondary;

  @override
  Color get onSecondary;

  @override
  Color get error;

  @override
  Color get onError;

  @override
  Color get surface;

  @override
  Color get onSurface;

  IgceColorSchema(
      {required Brightness? brightness,
      Color? primary,
      Color? onPrimary,
      Color? secondary,
      Color? onSecondary,
      Color? error,
      Color? onError,
      Color? surface,
      Color? onSurface})
      : super(
            brightness: brightness!,
            primary: primary!,
            onPrimary: onPrimary!,
            secondary: secondary!,
            onSecondary: onSecondary!,
            error: error!,
            onError: onError!,
            surface: surface!,
            onSurface: onSurface!);

  static get light => IgceColorSchema(
      brightness: Brightness.light,
      primary: AppColors.defaultLightColor,
      onPrimary: AppColors.white,
      secondary: AppColors.defaultLightColor,
      onSecondary: AppColors.white,
      error: AppColors.defaultErrorLightColor,
      onError: AppColors.defaultMainLightColor,
      surface: AppColors.backgroundAppLightColor,
      onSurface: AppColors.black);

  static get dark => IgceColorSchema(
      brightness: Brightness.dark,
      primary: AppColors.defaultDarkColor,
      onPrimary: AppColors.white,
      secondary: AppColors.defaultDarkColor,
      onSecondary: AppColors.white,
      error: AppColors.defaultErrorDarkColor,
      onError: AppColors.defaultMainDarkColor,
      surface: AppColors.backgroundAppDarkColor,
      onSurface: AppColors.white);
}
