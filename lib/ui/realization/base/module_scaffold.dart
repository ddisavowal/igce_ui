import 'package:flutter/material.dart';
import 'package:igce_theme/ui/ui.dart';

class ModuleScaffold extends IgceScaffold {
  const ModuleScaffold({
    super.key,
    required Widget body,
    String? title,
    PreferredSizeWidget? appBar,
    required Widget leading,
    PreferredSizeWidget? bottom,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    required Widget bottomNavigationBar,
  }) : super(
          body: body,
          title: title,
          appBar: appBar,
          leading: leading,
          bottom: bottom,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          bottomNavigationBar: bottomNavigationBar,
        );
}
