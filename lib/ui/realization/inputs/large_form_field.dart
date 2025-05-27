import 'package:flutter/material.dart';
import 'package:igce_theme/ui/interfaces/inputs/text_form_field.dart';

class LargeFormField extends IgceTextFormField {
  const LargeFormField(
      {super.key,
      bool isRequired = false,
      String? labelText,
      void Function(String)? onChanged,
      TextEditingController? controller})
      : super(
            isRequired: isRequired,
            labelText: labelText,
            onChanged: onChanged,
            controller: controller);

  @override
  int? getMinLines() {
    return 4;
  }

  @override
  int? getMaxLines() {
    return 20;
  }
}
