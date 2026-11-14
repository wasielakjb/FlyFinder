import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/flight_class_picker/widget/flight_class_bottom_sheet.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:flyfinder/templates/layout/system_picker_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormFlightClassPicker extends StatelessWidget {
  FormFlightClassPicker({
    required this.formControlName,
    required this.placeholder,
    this.validationMessages,
    this.wrapToSliver = false,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveFormField<FlightClass, FlightClass>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => SystemPickerField<FlightClass>(
            value: field.value,
            placeholder: placeholder,
            errorText: field.errorText,
            showPicker: (value) => FlightClassBottomSheet.show(
              context,
              value: value,
            ),
            onChanged: field.didChange,
            valuePresenter: (value) => value.resolveLabel(),
            suffixIcon: const Icon(Icons.flight_class_outlined),
          ),
        ),
      ),
    );
  }
}
