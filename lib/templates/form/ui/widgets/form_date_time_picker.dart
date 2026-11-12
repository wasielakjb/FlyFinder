import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormDateTimePicker extends StatelessWidget {
  FormDateTimePicker({
    required this.formControlName,
    required this.placeholder,
    this.validationMessages,
    this.type,
    this.dateFormat,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final ReactiveDatePickerFieldType? type;
  final DateFormat? dateFormat;
  final ValidationMsgMap? validationMessages;

  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveDateTimePicker(
          formControlName: formControlName,
          validationMessages: validationMessages,
          type: type ?? ReactiveDatePickerFieldType.date,
          dateFormat: dateFormat,
          style: context.bodyLarge.copyWith(fontSize: 16),
          showClearIcon: false,
          decoration: InputDecoration(
            hintText: placeholder,
            errorMaxLines: 2,
          ),
        ),
      ),
    );
  }
}
