import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/features/flights/ui/form/cubit/flights_form_cubit.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flight_form_keys.dart';
import 'package:flyfinder/features/flights/ui/form/widget/form_flight_date_picker.dart';
import 'package:flyfinder/templates/form/ui/layout/form_widget.dart';
import 'package:flyfinder/templates/form/ui/widgets/airport_location_selector/form_airport_location_selector.dart';
import 'package:flyfinder/templates/form/ui/widgets/cabin_class_picker/form_cabin_class_picker.dart';
import 'package:flyfinder/templates/form/ui/widgets/flight_passangers_selector/form_flight_passangers_selector.dart';
import 'package:flyfinder/templates/form/ui/widgets/form_trip_type_selector.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:intl/intl.dart';

typedef _K = FlightFormKeys;

class FlightsFormWidget extends StatelessWidget {
  const FlightsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FlightsFormCubit(repository: inject());
    return BlocProvider(
      create: (_) => cubit,
      lazy: false,
      child: FormWidget<FlightsFormCubit>(
        children: [
          FormTripTypeSelector(
            formControlName: _K.tripType,
            wrapToSliver: false,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FormAirportLocationSelector(
                  formControlName: _K.origin,
                  placeholder: 'From',
                  wrapToSliver: false,
                ),
              ),
              IconButton(
                onPressed: cubit.toggleAirports,
                icon: const Icon(Icons.sync_alt_outlined),
              ),
              Expanded(
                child: FormAirportLocationSelector(
                  formControlName: _K.destination,
                  placeholder: 'To',
                  wrapToSliver: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FormFlightDatePicker(
            departureControlName: _K.departureDate,
            returnControlName: _K.returnDate,
            tripTypeControlName: _K.tripType,
            departurePlaceholder: 'Departure date',
            returnPlaceholder: 'Return date',
            dateFormat: DateFormat('EEE, MMM d'),
            wrapToSliver: false,
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: FormCabinClassPicker(
                  formControlName: _K.cabinClass,
                  placeholder: 'Cabin class',
                  wrapToSliver: false,
                ),
              ),
              Expanded(
                child: FormFlightPassangersSelector(
                  formControlName: _K.passengers,
                  placeholder: 'Passengers',
                  wrapToSliver: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {},
            child: const AnyButtonContent(
              text: 'Search',
            ),
          ),
        ],
      ),
    );
  }
}
