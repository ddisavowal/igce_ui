import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class DefaultFloatingButton extends IgceFloatingButton {
  const DefaultFloatingButton({
    super.key,
    required String text,
    required VoidCallback onPressed,
  }) : super(text: text, onPressed: onPressed);
}
