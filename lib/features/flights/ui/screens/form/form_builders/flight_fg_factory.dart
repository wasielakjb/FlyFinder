import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_type.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/features/flights/ui/screens/form/form_builders/flight_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightFormKeys;

abstract class FlightFormGroupFactory {
  static FormGroup get create => FormGroup({
    _K.type: FormControl<FlightType>(
      value: FlightType.oneWay,
      validators: [Validators.required],
    ),
    _K.origin: FormControl<AirportResource>(
      validators: [Validators.required],
    ),
    _K.destination: FormControl<AirportResource>(
      validators: [Validators.required],
    ),
    _K.departureDate: FormControl<DateTime>(
      validators: [Validators.required],
    ),
    _K.returnDate: FormControl<DateTime>(),
    _K.flightClass: FormControl<FlightClass>(
      validators: [Validators.required],
    ),
    _K.passengers: FormControl<FlightPassengers>(
      validators: [Validators.required],
    ),
  });
}
