import 'package:flutter/widgets.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class ArrowCard extends IgceCard {
  const ArrowCard({
    super.key,
    required String title,
    VoidCallback? onTap,
  }) : super(title: title, onTap: onTap);
}
