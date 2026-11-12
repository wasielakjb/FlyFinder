import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/enum/trip_type.dart';
import 'package:flyfinder/templates/form/ui/widgets/form_date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFlightDatePicker extends StatelessWidget {
  const FormFlightDatePicker({
    required this.departureControlName,
    required this.returnControlName,
    required this.tripTypeControlName,
    required this.departurePlaceholder,
    required this.returnPlaceholder,
    this.dateFormat,
    this.wrapToSliver = true,
    super.key,
  });

  final String departureControlName;
  final String returnControlName;
  final String tripTypeControlName;
  final String departurePlaceholder;
  final String returnPlaceholder;
  final DateFormat? dateFormat;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<TripType>(
      formControlName: tripTypeControlName,
      builder: (context, control, child) => Row(
        spacing: 16,
        children: [
          Expanded(
            child: FormDateTimePicker(
              formControlName: departureControlName,
              placeholder: departurePlaceholder,
              dateFormat: DateFormat('EEE, MMM d'),
              wrapToSliver: wrapToSliver,
            ),
          ),
          if (control.value == TripType.roundTrip)
            Expanded(
              child: FormDateTimePicker(
                formControlName: returnControlName,
                placeholder: returnPlaceholder,
                dateFormat: DateFormat('EEE, MMM d'),
                wrapToSliver: wrapToSliver,
              ),
            ),
        ],
      ),
    );
  }
}
