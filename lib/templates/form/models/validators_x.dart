import 'package:flyfinder/templates/form/validators/password_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class ValidatorsX {
  static Validator<String> get password => const PasswordValidator();
}
