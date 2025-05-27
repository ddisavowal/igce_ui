import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class ElevatedButton40 extends IgceElevatedButton {
  const ElevatedButton40({
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
    return MediaQuery.of(context).size.width * 0.40;
  }
}
