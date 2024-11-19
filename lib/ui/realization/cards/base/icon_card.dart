import 'package:flutter/widgets.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class IconCard extends IgceCard {
  final Widget icon;
  const IconCard({
    super.key,
    required this.icon,
    required String title,
    VoidCallback? onTap,
  }) : super(title: title, onTap: onTap);

  @override
  Widget getTrailing(BuildContext context) {
    return icon;
  }
}
