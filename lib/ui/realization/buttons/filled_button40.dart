import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class FilledButton40 extends IgceFilledButton {
  const FilledButton40({
    super.key,
    this.buttonColor,
    required super.text,
    required super.onPressed,
  });

  final Color? buttonColor;

  @override
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.4;
  }

  @override
  ButtonStyle? getStyle(BuildContext context) {
    return buttonColor == null
        ? null
        : FilledButton.styleFrom(backgroundColor: buttonColor);
  }
}
