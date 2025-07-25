import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  const IgceScaffold({
    super.key,
    required this.body,
    this.title,
    this.appBar,
    this.leading,
    this.actions,
    this.bottom,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });

  Widget? getLeading() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(
              title ?? '',
              style: context.textTheme.defaultText20,
            ),
            backgroundColor: context.colorTheme.defaultColor,
            surfaceTintColor: context.colorTheme.defaultColor,
            // shadowColor: context.colorTheme.defaultTransparentColor,
            leading: leading,
            actions: actions,
            bottom: bottom,
          ),
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
