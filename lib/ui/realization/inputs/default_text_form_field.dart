import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:igce_theme/ui/interfaces/inputs/inputs.dart';

class DefaultFormField extends IgceTextFormField {
  final String? Function(String?)? validator;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardStyle;

  const DefaultFormField(
      {super.key,
      bool isRequired = false,
      String? labelText,
      this.hintText,
      this.inputFormatters,
      this.keyboardStyle,
      void Function(String)? onChanged,
      TextEditingController? controller,
      this.validator})
      : super(
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
}
