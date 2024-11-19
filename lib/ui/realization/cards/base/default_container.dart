import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class DefaultContainer extends IgceContainer {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const DefaultContainer(
      {super.key, required this.child, this.margin, this.padding})
      : super(child: child);
}
