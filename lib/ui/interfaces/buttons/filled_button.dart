import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const IgceFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  double? getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.37;
  }

  ButtonStyle? getStyle(BuildContext context) {
    return null;
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: 39,
      child: FilledButton(
        onPressed: onPressed,
        style: getStyle(context),
        child: Text(
          text,
          // style: getTextStyle(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
