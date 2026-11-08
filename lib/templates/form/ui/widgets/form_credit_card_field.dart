import 'package:awesome_card/extra/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flyfinder/templates/form/ui/widgets/form_text_field.dart';

class FormCreditCardField<T> extends StatelessWidget {
  FormCreditCardField({
    required this.formControlName,
    required this.placeholder,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return FormTextField<T>(
      formControlName: formControlName,
      placeholder: placeholder,
      wrapToSliver: wrapToSliver,
      keyboardType: TextInputType.number,
      inputFormatters: [CreditCardFormatter()],
      suffixBuilder: (context, control) {
        final value = control.value;
        if (value is! String || value.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.only(right: 16),
          alignment: Alignment.center,
          height: 24,
          width: 24,
          child: getCardTypeIcon(cardNumber: value),
        );
      },
    );
  }
}

class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limitedDigits = digits.length > 19 ? digits.substring(0, 19) : digits;
    final buffer = StringBuffer();

    for (var i = 0; i < limitedDigits.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(limitedDigits[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: formatted.length,
      ),
    );
  }
}
