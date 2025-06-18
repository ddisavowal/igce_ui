import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:igce_theme/ui/interfaces/inputs/inputs.dart';

class DefaultFormField extends IgceTextFormField {
  final String? Function(String?)? validator;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardStyle;
  final Widget? suffixIcon;

  const DefaultFormField({
    super.key,
    super.isRequired,
    super.labelText,
    this.hintText,
    this.inputFormatters,
    this.keyboardStyle,
    super.borderColor,
    super.onChanged,
    super.controller,
    this.validator,
    this.suffixIcon,
    bool? readonly,
  }) : super(
          readOnly: readonly,
        );

  @override
  String? Function(String? p1)? getValidator() => validator;

  @override
  String? getHintText() {
    return hintText;
  }

  @override
  List<TextInputFormatter>? getInputFormates() {
    return inputFormatters;
  }

  @override
  TextInputType? getKeyboardStyle() {
    return keyboardStyle;
  }

  @override
  Widget? getSuffixIcon(BuildContext context) {
    return suffixIcon;
  }
}
