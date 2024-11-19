import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class ElevatedButton70 extends IgceElevatedButton {
  const ElevatedButton70({
    super.key,
    required super.text,
    required super.onPressed,
  });

  @override
  double? getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.7;
  }
}
