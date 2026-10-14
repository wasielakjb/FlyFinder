import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/models/validators_x.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = RegisterKeys;

abstract class RegisterFormGroupFactory {
  static FormGroup create() {
    return FormGroup(
      {
        _K.email: FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        _K.password: FormControl<String>(
          validators: [Validators.required, ValidatorsX.password],
        ),
        _K.confirmPassword: FormControl<String>(
          validators: [Validators.required],
        ),
      },
      validators: [
        Validators.mustMatch(_K.password, _K.confirmPassword),
      ],
    );
  }
}
