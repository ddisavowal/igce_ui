import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class IconListTile extends IgceListTile {
  final IconData icon;
  final Color? tileColor;
  final Color? splashColor;
  final Color? iconColor;

  const IconListTile({
    super.key,
    required this.icon,
    required String title,
    this.tileColor,
    this.splashColor,
    this.iconColor,
    void Function()? onTap,
  }) : super(title: title, onTap: onTap);

  @override
  IconData? getIconData(BuildContext context) {
    return icon;
  }

  @override
  Color? getTileColor(BuildContext context) {
    return tileColor ?? context.colorTheme.backgroundWidgetColor;
  }

  @override
  Color? getSplashColor(BuildContext context) {
    return splashColor ?? context.colorTheme.lightClickColor;
  }

  @override
  Color? getIconColor(BuildContext context) =>
      iconColor ?? context.theme.colorScheme.primary;
}
