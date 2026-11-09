import 'package:awesome_card/extra/helper.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:flyfinder/features/payment_methods/domain/repository/payment_methods_repository.dart';
import 'package:flyfinder/features/payment_methods/domain/request/payment_method_request.dart';
import 'package:flyfinder/features/payment_methods/ui/screens/form/form_builders/payment_method_fg_factory.dart';
import 'package:flyfinder/features/payment_methods/ui/screens/form/form_builders/payment_method_form_keys.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = PaymentMethodFormKeys;

class PaymentMethodFormCubit extends FormCubit<PaymentMethodResource> {
  PaymentMethodFormCubit({
    required this.repository,
    this.resourceId,
    super.resource,
  });
  
  @override
  final String? resourceId;

  @protected
  final PaymentMethodsRepository repository;

  @override
  FormGroup buildForm() => PaymentMethodFormGroupFactory.create(state.resource);

  @override
  FormRequest mapBeforeSubmit() {
    final number = formGroup.controlVal<String>(_K.number)!;
    return PaymentMethodRequest(
      number: number.last4,
      name: formGroup.controlVal<String>(_K.name)!,
      type: getCardType(number).name,
      expirationDate: formGroup.controlVal<String>(_K.expirationDate)!,
      isActive: false,
    );
  }

  @override
  Future<dynamic> sendForm(PaymentMethodRequest request) {
    return resourceId != null
        ? repository.update(resourceId!, request)
        : repository.create(request);
  }
}

extension StringExtension on String {
  String get last4 {
    final digits = replaceAll(RegExp(r'\D'), '');
    if (digits.length < 4) {
      throw ArgumentError('String must contain at least 4 digits');
    }
    return digits.substring(digits.length - 4);
  }
}
