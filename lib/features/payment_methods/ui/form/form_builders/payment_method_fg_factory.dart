import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:flyfinder/features/payment_methods/ui/form/form_builders/payment_method_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = PaymentMethodFormKeys;

abstract class PaymentMethodFormGroupFactory {
  static FormGroup create(PaymentMethodResource? resource) => FormGroup({
    _K.number: FormControl<String>(
      value: resource?.number,
      validators: [Validators.required],
    ),
    _K.name: FormControl<String>(
      value: resource?.name,
      validators: [Validators.required],
    ),
    _K.cvv: FormControl<String>(
      validators: [Validators.required],
    ),
    _K.expirationDate: FormControl<String>(
      value: resource?.expirationDate.toExpiryString(),
      validators: [Validators.required],
    ),
  });
}

extension on DateTime {
  String toExpiryString() {
    final month = this.month.toString().padLeft(2, '0');
    final year = (this.year % 100).toString().padLeft(2, '0');
    return '$month/$year';
  }
}
