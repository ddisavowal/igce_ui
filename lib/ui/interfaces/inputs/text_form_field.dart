import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igce_theme/extensions/extensions.dart';

abstract class IgceTextFormField extends StatelessWidget {
  final bool isRequired;
  final String? labelText;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool? readOnly;
  const IgceTextFormField(
      {super.key,
      this.isRequired = false,
      this.labelText,
      this.onChanged,
      this.onTap,
      this.controller,
      this.readOnly});

  Color? getFillColor(BuildContext context) {
    return null;
  }

  TextStyle? getTextStyle(BuildContext context) {
    return context.textTheme.defaultText14;
  }

  TextStyle? getHintStyle(BuildContext context) {
    return context.textTheme.lightText14;
  }

  TextStyle? getLabelStyle(BuildContext context) {
    return context.textTheme.accentText14;
  }

  Widget? getLable(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: labelText,
            style: context.textTheme.defaultText14,
            children: isRequired
                ? [
                    TextSpan(
                        text: " *",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: context.theme.colorScheme.error))
                  ]
                : null));
  }

  String? getHintText() {
    return null;
  }

  TextInputType? getKeyboardStyle() {
    return TextInputType.text;
  }

  List<TextInputFormatter>? getInputFormates() {
    return null;
  }

  Widget? getPrefixIcon(BuildContext context) {
    return null;
  }

  FocusNode? getFocusNode() {
    return null;
  }

  Iterable<String>? getAutofillHints() {
    return null;
  }

  Widget? getSuffixIcon(BuildContext context) {
    return null;
  }

  String? Function(String?)? getValidator() {
    return null;
  }

  bool getObsureText() {
    return false;
  }

  bool getEnableSuggestions() {
    return true;
  }

  bool getAutocorrect() {
    return true;
  }

  int? getMinLines() {
    return 1;
  }

  int? getMaxLines() {
    return 1;
  }

  InputBorder? getBorder(BuildContext context) {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(8));
  }

  InputBorder? getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: context.theme.primaryColor, width: 1.5));
  }

  InputBorder? getEnabledBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: context.colorTheme.defaultGreyColor, width: 1.5));
  }

  InputBorder? getErrorBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: context.theme.colorScheme.error, width: 1.5));
  }

  EdgeInsets getContentPadding() {
    return const EdgeInsets.fromLTRB(15, 16, 15, 16);
  }

  EdgeInsets getPadding() {
    return const EdgeInsets.symmetric(horizontal: 15);
  }

  BoxConstraints? getConstrains() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTapOutside: (ev) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autofillHints: getAutofillHints(),
        focusNode: getFocusNode(),
        style: getTextStyle(context),
        inputFormatters: getInputFormates(),
        keyboardType: getKeyboardStyle(),
        keyboardAppearance: context.theme.brightness == Brightness.light
            ? Brightness.light
            : Brightness.dark,
        controller: controller,
        validator: getValidator(),
        obscureText: getObsureText(),
        enableSuggestions: getEnableSuggestions(),
        autocorrect: getAutocorrect(),
        minLines: getMinLines(),
        maxLines: getMaxLines(),
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
            isDense: true,
            constraints: getConstrains(),
            contentPadding: getContentPadding(),
            filled: getFillColor(context) != null,
            fillColor: getFillColor(context),
            label: getLable(context),
            hintText: getHintText(),
            hintStyle: getHintStyle(context),
            labelStyle: getLabelStyle(context),
            prefixIcon: getPrefixIcon(context),
            suffixIcon: getSuffixIcon(context),
            border: getBorder(context),
            focusedBorder: getFocusedBorder(context),
            enabledBorder: getEnabledBorder(context),
            errorBorder: getErrorBorder(context)),
      ),
    );
  }
}
