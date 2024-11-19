import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const IgceContainer(
      {super.key, required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? const EdgeInsets.all(10),
        margin:
            margin ?? const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        // width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: context.colorTheme.backgroundWidgetColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: context.colorTheme.boxShadowColor,
              offset: const Offset(0, 0), // X0 Y0
              blurRadius: 6, // Blur 6
              spreadRadius: 0, // Spread 0
            ),
          ],
        ),
        child: child);
  }
}
