import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const IgceElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  double? getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.37;
  }

  double? getHeight(BuildContext context) {
    return 39;
  }

  ButtonStyle? getStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        disabledBackgroundColor: context.colorTheme.defaultTransparentColor
        // context.theme.scaffoldBackgroundColor
        );
  }

  TextStyle? getTextStyle(BuildContext context) {
    return context.textTheme.defaultText14.copyWith(
        color: onPressed == null
            ? context.colorTheme.defaultGreyColor
            : context.colorTheme.primaryColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: getHeight(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: getStyle(context),
        child: Text(text, style: getTextStyle(context)),
      ),
    );
  }
}
