import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class ElevatedButton50 extends IgceElevatedButton {
  const ElevatedButton50({
    super.key,
    this.borderColor,
    this.textColor,
    required super.text,
    required super.onPressed,
  });

  final Color? borderColor;
  final Color? textColor;

  double? getHeight(BuildContext context) {
    return 39;
  }

  double? getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.50;
  }

  // @override
  // ButtonStyle? getStyle(BuildContext context) {
  //   return borderColor == null
  //       ? ElevatedButton.styleFrom(
  //           disabledBackgroundColor: context.colorTheme.defaultTransparentColor
  //           // context.theme.scaffoldBackgroundColor
  //           )
  //       : ElevatedButton.styleFrom(
  //               disabledBackgroundColor:
  //                   context.colorTheme.defaultTransparentColor
  //               // context.theme.scaffoldBackgroundColor
  //               )
  //           .copyWith(side: WidgetStateProperty.resolveWith<BorderSide?>(
  //           (Set<WidgetState> states) {
  //             if (states.contains(WidgetState.disabled)) {
  //               return BorderSide(
  //                   width: 1.6, color: context.colorTheme.defaultGreyColor);
  //             }
  //             return BorderSide(width: 1.6, color: borderColor!);
  //           },
  //         ));
  // }

  // @override
  // TextStyle? getTextStyle(BuildContext context) {
  //   return context.textTheme.defaultText14.copyWith(
  //       color: onPressed == null
  //           ? context.colorTheme.defaultGreyColor
  //           : textColor ?? context.colorTheme.defaultColor,
  //       overflow: TextOverflow.ellipsis,
  //       fontWeight: FontWeight.w500);
  // }
}
