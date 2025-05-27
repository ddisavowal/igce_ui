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
    bool isRequired = false,
    String? labelText,
    this.hintText,
    this.inputFormatters,
    this.keyboardStyle,
    void Function(String)? onChanged,
    TextEditingController? controller,
    this.validator,
    this.suffixIcon,
    bool? readonly,
  }) : super(
          readOnly: readonly,
          isRequired: isRequired,
          labelText: labelText,
          onChanged: onChanged,
          controller: controller,
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
