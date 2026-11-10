import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/features/flights/domain/model/travel_class.dart';
import 'package:flyfinder/features/flights/domain/model/travel_type.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flights_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightsFormKeys;

abstract class FlightsFormGroupFactory {
  static FormGroup create() => FormGroup({
    _K.travelType: FormControl<TravelType>(
      validators: [Validators.required],
    ),
    _K.from: FormControl<String>(
      validators: [Validators.required],
    ),
    _K.to: FormControl<String>(
      validators: [Validators.required],
    ),
    _K.departureDate: FormControl<DateTime>(
      validators: [Validators.required],
    ),
    _K.returnDate: FormControl<DateTime>(),
    _K.passengers: FormControl<FlightPassengers>(
      validators: [Validators.required],
    ),
    _K.travelClass: FormControl<TravelClass>(
      validators: [Validators.required],
    ),
  });
}
