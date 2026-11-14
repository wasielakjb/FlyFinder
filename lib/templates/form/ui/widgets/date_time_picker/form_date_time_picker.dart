import 'package:flutter/material.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:flyfinder/templates/layout/system_picker_field.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormDateTimePicker extends StatelessWidget {
  FormDateTimePicker({
    required this.formControlName,
    required this.placeholder,
    this.dateFormat,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.type,
    this.validationMessages,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final DateFormat? dateFormat;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final OmniDateTimePickerType? type;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  static DateTime defaultFirstDate = DateTime.now().subtract(
    const Duration(days: 365),
  );

  static DateTime defaultLastDate = DateTime.now().add(
    const Duration(days: 365),
  );

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveFormField<DateTime, DateTime>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => SystemPickerField<DateTime>(
            showPicker: (value) => showOmniDateTimePicker(
              context: context,
              initialDate: value ?? initialDate,
              firstDate: firstDate,
              lastDate: lastDate,
              type: type ?? OmniDateTimePickerType.date,
            ),
            value: field.value,
            onChanged: field.didChange,
            placeholder: placeholder,
            errorText: field.errorText,
            suffixIcon: const Icon(Icons.calendar_month),
            valuePresenter: (dateFormat ?? DateFormat('dd.MM.y')).format,
          ),
        ),
      ),
    );
  }
}
