import 'package:flyfinder/features/payment_methods/ui/screens/form/form_builders/payment_method_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = PaymentMethodFormKeys;

abstract class PaymentMethodFormGroupFactory {
  static FormGroup create() => FormGroup({
    _K.number: FormControl<String>(
      validators: [Validators.required],
    ),
    _K.name: FormControl<String>(
      validators: [Validators.required],
    ),
    _K.cvv: FormControl<String>(
      validators: [Validators.required],
    ),
    _K.expirationDate: FormControl<String>(
      validators: [Validators.required],
    ),
  });
}
