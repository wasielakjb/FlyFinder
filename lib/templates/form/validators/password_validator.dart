import 'package:reactive_forms/reactive_forms.dart';

class PasswordValidator extends Validator<String> {
  const PasswordValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<String> control) {
    if (control.value?.isEmpty ?? true) {
      return null;
    }

    final error = <String, dynamic>{};

    if (control.value!.length < 8) {
      error['minLength'] = true;
    }

    if (!RegExp('[A-Z]').hasMatch(control.value!)) {
      error['uppercase'] = true;
    }
    if (!RegExp('[a-z]').hasMatch(control.value!)) {
      error['lowercase'] = true;
    }

    if (!RegExp('[0-9]').hasMatch(control.value!)) {
      error['digit'] = true;
    }

    if (!RegExp('[^A-Za-z0-9]').hasMatch(control.value!)) {
      error['specialChar'] = true;
    }

    return error.isEmpty ? null : error;
  }
}
