import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/flight_passangers_selector/widget/flight_passangers_bottom_sheet.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:flyfinder/templates/layout/system_picker_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormFlightPassangersSelector extends StatelessWidget {
  FormFlightPassangersSelector({
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
        child: ReactiveFormField<FlightPassengers, FlightPassengers>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => SystemPickerField<FlightPassengers>(
            value: field.value,
            placeholder: placeholder,
            errorText: field.errorText,
            showPicker: (value) => FlightPassangersBottomSheet.show(
              context,
              value: value,
            ),
            onChanged: field.didChange,
            valuePresenter: (value) => value.total == 1
                ? '${value.total} traveler'
                : '${value.total} travelers',
            suffixIcon: const Icon(Icons.group_outlined),
          ),
        ),
      ),
    );
  }
}
