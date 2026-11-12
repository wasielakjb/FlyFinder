import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';
import 'package:flyfinder/features/flights/domain/enum/trip_type.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flight_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightFormKeys;

abstract class FlightFormGroupFactory {
  static FormGroup get create => FormGroup({
    _K.tripType: FormControl<TripType>(
      value: TripType.oneWay,
      validators: [Validators.required],
    ),
    _K.origin: FormControl<AirportResource>(
      validators: [Validators.required],
    ),
    _K.destination: FormControl<AirportResource>(
      validators: [Validators.required],
    ),
    _K.departureDate: FormControl<DateTime>(
      value: DateTime.now(),
      validators: [Validators.required],
    ),
    _K.returnDate: FormControl<DateTime>(),
    _K.cabinClass: FormControl<CabinClass>(
      value: CabinClass.economy,
      validators: [Validators.required],
    ),
    _K.passengers: FormControl<FlightPassengers>(
      validators: [Validators.required],
    ),
  });
}
