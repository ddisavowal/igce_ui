import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:igce_theme/ui/interfaces/interfaces.dart';

class PasswordFormField extends IgceTextFormField {
  final void Function()? onIconPressed;
  final bool passwordObscurity;
  PasswordFormField(
      {super.key,
      bool isRequired = false,
      String? labelText,
      void Function(String)? onChanged,
      required this.onIconPressed,
      required this.passwordObscurity,
      TextEditingController? controller})
      : super(
            isRequired: isRequired,
            labelText: labelText,
            onChanged: onChanged,
            controller: controller);

  RequiredValidator requiredValidator =
      RequiredValidator(errorText: 'Поле обязательно к заполнению');

  @override
  Widget? getSuffixIcon(BuildContext context) {
    return IconButton(
      icon: Icon(
        passwordObscurity ? Icons.visibility_off : Icons.remove_red_eye_rounded,
      ),
      onPressed: onIconPressed,
    );
  }

  @override
  String? Function(String?)? getValidator() {
    return requiredValidator.call;
  }

  @override
  bool getObsureText() {
    return passwordObscurity;
  }

  @override
  bool getEnableSuggestions() {
    return false;
  }

  @override
  bool getAutocorrect() {
    return false;
  }
}
