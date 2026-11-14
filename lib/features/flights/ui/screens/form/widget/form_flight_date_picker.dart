import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_type.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/form/ui/widgets/date_time_picker/form_date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFlightDatePicker extends StatelessWidget {
  FormFlightDatePicker({
    required this.departureControlName,
    required this.returnControlName,
    required this.typeControlName,
    required this.departurePlaceholder,
    required this.returnPlaceholder,
    this.dateFormat,
    this.validationMessages,
    this.wrapToSliver = false,
  }) : super(key: ValueKey(departureControlName));

  final String departureControlName;
  final String returnControlName;
  final String typeControlName;
  final String departurePlaceholder;
  final String returnPlaceholder;
  final DateFormat? dateFormat;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<FlightType>(
      formControlName: typeControlName,
      builder: (context, control, _) => Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ReactiveValueListenableBuilder<DateTime>(
              formControlName: returnControlName,
              builder: (context, control, _) => FormDateTimePicker(
                formControlName: departureControlName,
                placeholder: departurePlaceholder,
                dateFormat: dateFormat,
                initialDate:
                    control.value?.subtract(const Duration(days: 1)) ??
                    DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: control.value?.subtract(const Duration(days: 1)),
                wrapToSliver: false,
              ),
            ),
          ),
          if (control.value == FlightType.roundTrip)
            Expanded(
              child: ReactiveValueListenableBuilder<DateTime>(
                formControlName: departureControlName,
                builder: (context, control, _) => FormDateTimePicker(
                  formControlName: returnControlName,
                  placeholder: returnPlaceholder,
                  dateFormat: dateFormat,
                  initialDate: (control.value ?? DateTime.now()).add(
                    const Duration(days: 1),
                  ),
                  firstDate: (control.value ?? DateTime.now()).add(
                    const Duration(days: 1),
                  ),
                  wrapToSliver: false,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
