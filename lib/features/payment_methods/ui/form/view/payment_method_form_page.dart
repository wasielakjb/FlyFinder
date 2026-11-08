import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/features/payment_methods/ui/form/cubit/payment_method_form_cubit.dart';
import 'package:flyfinder/features/payment_methods/ui/form/form_builders/payment_method_form_keys.dart';
import 'package:flyfinder/templates/form/models/card_expiration_date_formatter.dart';
import 'package:flyfinder/templates/form/ui/layout/form_scaffold.dart';
import 'package:flyfinder/templates/form/ui/layout/form_sliver_gap.dart';
import 'package:flyfinder/templates/form/ui/widgets/form_credit_card_field.dart';
import 'package:flyfinder/templates/form/ui/widgets/form_text_field.dart';
import 'package:flyfinder/templates/layout/app_expanded_row.dart';
import 'package:flyfinder/templates/layout/sliver_to_inset_box_adapter.dart';
typedef _K = PaymentMethodFormKeys;

@RoutePage()
class PaymentMethodFormPage extends StatelessWidget
    implements AutoRouteWrapper {
  const PaymentMethodFormPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentMethodFormCubit(
        repository: inject(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormScaffold<PaymentMethodFormCubit>(
      title: const Text('New payment method'),
      creatingText: 'Add card',
      slivers: [
        const FormSliverGap(32),
        FormCreditCardField<String>(
          formControlName: _K.number,
          placeholder: 'Card number',
        ),
        const FormSliverGap(),
        FormTextField<String>(
          formControlName: _K.name,
          placeholder: 'Full name',
          keyboardType: TextInputType.name,
        ),
        const FormSliverGap(),
        SliverToInsetBoxAdapter(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppExpandedRow(
            spacing: 20,
            children: [
              FormTextField<String>(
                formControlName: _K.expirationDate,
                placeholder: 'MM/YY',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  CardExpirationDateFormatter(),
                ],
                wrapToSliver: false,
              ),
              FormTextField<String>(
                formControlName: _K.cvv,
                placeholder: 'CVV/CVC',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                wrapToSliver: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
