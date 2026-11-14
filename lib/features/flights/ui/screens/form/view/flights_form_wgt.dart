import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/features/flights/ui/screens/form/cubit/flights_form_cubit.dart';
import 'package:flyfinder/features/flights/ui/screens/form/form_builders/flight_form_keys.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/flight_class_picker/form_flight_class_picker.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/flight_passangers_selector/form_flight_passangers_selector.dart'
    show FormFlightPassangersSelector;
import 'package:flyfinder/features/flights/ui/screens/form/widget/flight_route_picker/form_flight_route_picker.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/form_flight_date_picker.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/form_flight_type_segment.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef _K = FlightFormKeys;

class FlightsFormWidget extends StatelessWidget implements AutoRouteWrapper {
  const FlightsFormWidget({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightsFormCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FlightsFormCubit>();
    return BlocBuilder<FlightsFormCubit, FlightsFormState>(
      builder: (context, state) => Skeletonizer(
        enabled: !state.initialized,
        child: ReactiveForm(
          formGroup: cubit.formGroup,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormFlightTypeSegment(formControlName: _K.type),
              Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FormFlightRoutePicker(
                      formControlName: _K.origin,
                      placeholder: 'Select departure airport',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: IconButton.filled(
                      onPressed: cubit.toggleAirports,
                      iconSize: 20,
                      icon: const Icon(Icons.sync_alt_outlined),
                    ),
                  ),
                  Expanded(
                    child: FormFlightRoutePicker(
                      formControlName: _K.destination,
                      placeholder: 'Select arrival airport',
                    ),
                  ),
                ],
              ),
              FormFlightDatePicker(
                departureControlName: _K.departureDate,
                returnControlName: _K.returnDate,
                typeControlName: _K.type,
                departurePlaceholder: 'Select departure date',
                returnPlaceholder: 'Select return date',
                dateFormat: DateFormat('EEE, MMM d'),
              ),
              Row(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FormFlightClassPicker(
                      formControlName: _K.flightClass,
                      placeholder: 'Select flight class',
                    ),
                  ),
                  Expanded(
                    child: FormFlightPassangersSelector(
                      formControlName: _K.passengers,
                      placeholder: 'Select number of passengers',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: FilledButton(
                  onPressed: () => cubit.submit.call(context),
                  child: const AnyButtonContent(text: 'Search'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
