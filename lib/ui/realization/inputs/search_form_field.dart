import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/extensions.dart';
import 'package:igce_theme/ui/interfaces/inputs/inputs.dart';

class SearchFormField extends IgceTextFormField {
  final bool isClearEnable;
  final void Function()? onClearPressed;
  final EdgeInsets? padding;
  const SearchFormField(
      {super.key,
      bool isRequired = false,
      String? labelText,
      void Function(String)? onChanged,
      required this.isClearEnable,
      required this.onClearPressed,
      this.padding,
      required TextEditingController? controller})
      : super(
            isRequired: isRequired,
            labelText: labelText,
            onChanged: onChanged,
            controller: controller);

  @override
  Color? getFillColor(BuildContext context) {
    return context.colorTheme.accentColor;
  }

  @override
  TextStyle? getTextStyle(BuildContext context) {
    return context.textTheme.defaultText14;
  }

  @override
  TextStyle? getHintStyle(BuildContext context) {
    return context.textTheme.accentText14;
  }

  @override
  Widget? getLable(BuildContext context) {
    return null;
  }

  @override
  String? getHintText() {
    return labelText;
  }

  @override
  InputBorder? getBorder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        borderRadius: BorderRadius.circular(10));
  }

  @override
  InputBorder? getFocusedBorder(BuildContext context) {
    return null;
  }

  @override
  InputBorder? getEnabledBorder(BuildContext context) {
    return null;
  }

  @override
  InputBorder? getErrorBorder(BuildContext context) {
    return null;
  }

  @override
  EdgeInsets getContentPadding() {
    return const EdgeInsets.fromLTRB(15, 0, 15, 0);
  }

  @override
  BoxConstraints? getConstrains() {
    return const BoxConstraints(maxHeight: 40);
  }

  @override
  EdgeInsets getPadding() {
    return padding ?? const EdgeInsets.only(right: 20);
  }

  @override
  Widget? getSuffixIcon(BuildContext context) {
    return isClearEnable
        ? IconButton(
            icon: Icon(Icons.close_rounded,
                color: context.theme.colorScheme.onSecondary),
            onPressed: onClearPressed,
          )
        : const SizedBox();
  }

  @override
  Widget? getPrefixIcon(BuildContext context) {
    return Icon(
      Icons.search,
      color: context.colorTheme.accentTextColor,
      size: 25,
    );
  }
}
