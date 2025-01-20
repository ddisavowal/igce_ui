import 'package:flutter/material.dart';
import 'package:igce_theme/ui/ui.dart';

class DefaultScaffold extends IgceScaffold {
  const DefaultScaffold({
    super.key,
    required Widget body,
    String? title,
    PreferredSizeWidget? appBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) : super(
            body: body,
            title: title,
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation);
}
