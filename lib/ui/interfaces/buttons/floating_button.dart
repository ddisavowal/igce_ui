import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceFloatingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const IgceFloatingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.50;
  }

  TextStyle? getTextStyle(BuildContext context) {
    return context.textTheme.defaultText14.copyWith(
        color: onPressed == null
            ? context.theme.brightness == Brightness.light
                ? context.theme.primaryColor.withOpacity(0.4)
                : context.colorTheme.backgroundAppColor.withOpacity(0.7)
            : context.theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500);
  }

  Color? getBackgroundColor(BuildContext context) {
    return context.theme.primaryColor;
  }

  ShapeBorder? getShape() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: 39,
      child: FloatingActionButton(
          onPressed: onPressed,
          // backgroundColor: getBackgroundColor(context),
          shape: getShape(),
          // focusColor: context.colorTheme.mainClickColor,
          // hoverColor: context.colorTheme.mainClickColor,
          // splashColor: context.colorTheme.mainClickColor,
          elevation: 0,
          child: Text(
            text,
          )
          // style: getTextStyle(context)),
          ),
    );
  }
}
