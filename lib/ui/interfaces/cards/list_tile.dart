import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceListTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const IgceListTile({super.key, required this.title, this.onTap});

  TextStyle? getTextStyle(BuildContext context) {
    return context.textTheme.defaultText14;
  }

  IconData? getIconData(BuildContext context) {
    return null;
  }

  Color? getTileColor(BuildContext context) {
    return context.colorTheme.backgroundWidgetColor;
  }

  Color? getSplashColor(BuildContext context) =>
      context.colorTheme.lightClickColor;

  Color? getIconColor(BuildContext context) =>
      context.theme.colorScheme.onSurface;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getTileColor(context),
      child: InkWell(
        onTap: onTap,
        splashColor: getSplashColor(context),
        highlightColor: context.colorTheme.defaultTransparentColor,
        child: ListTile(
          title: Text(
            title,
            style: getTextStyle(context),
          ),
          leading: Icon(
            getIconData(context),
            color: getIconColor(context),
          ),
        ),
      ),
    );
  }
}
