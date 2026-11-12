import 'package:flutter/cupertino.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';
import 'package:flyfinder/features/flights/domain/enum/trip_type.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/repository/flights_repository.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flight_fg_factory.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flight_form_keys.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightFormKeys;

class FlightsFormCubit extends FormCubit {
  FlightsFormCubit({required this.repository});

  @protected
  final FlightsRepository repository;

  @override
  FormGroup buildForm() => FlightFormGroupFactory.create;

  @override
  FlightRequest mapBeforeSubmit() {
    return FlightRequest(
      origin: formGroup.controlVal<AirportResource>(_K.origin)!.code,
      destination: formGroup.controlVal<AirportResource>(_K.destination)!.code,
      departureDate: formGroup
          .controlVal<DateTime>(_K.departureDate)!
          .toApiFormat(),
      returnDate: formGroup.controlVal<DateTime>(_K.returnDate)?.toApiFormat(),
      cabinClass: formGroup.controlVal<CabinClass>(_K.cabinClass)!,
      adults: 1,
      children: 0,
    );
  }

  @override
  Future<dynamic> sendForm(FlightRequest request) {
    return switch (formGroup.controlVal<TripType>(_K.tripType)!) {
      TripType.oneWay => repository.getOneWayFlights(request),
      TripType.roundTrip => repository.getRoundTripFlights(request),
    };
  }

  void toggleAirports() {
    final currOrigin = formGroup.controlVal<AirportResource>(_K.origin);
    final currDestination = formGroup.controlVal<AirportResource>(_K.destination);
    formGroup.controlX<AirportResource>(_K.origin).patchValue(currDestination);
    formGroup.controlX<AirportResource>(_K.destination).patchValue(currOrigin);
  }
}

extension on DateTime {
  String toApiFormat() => DateFormat('yyyy-MM-dd').format(this);
}
