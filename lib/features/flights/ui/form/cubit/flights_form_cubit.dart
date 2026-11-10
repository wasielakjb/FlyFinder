import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/features/flights/domain/model/travel_class.dart';
import 'package:flyfinder/features/flights/domain/model/travel_type.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flights_fg_factory.dart';
import 'package:flyfinder/features/flights/ui/form/form_builders/flights_form_keys.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K =  FlightsFormKeys;

//TODO implement FlightResource
class FlightsFormCubit extends FormCubit<String> { 

  //TODO implement FlightsRepository
  // @protected
  // final FlightsRepository repository;

  @override
  String? get resourceId => null;

  @override
  FormGroup buildForm() => FlightsFormGroupFactory.create();

  @override
  FlightRequest mapBeforeSubmit() {
    return FlightRequest(
      travelType: formGroup.controlVal<TravelType>(_K.travelType)!.value,
      from: formGroup.controlVal<String>(_K.from)!,
      to: formGroup.controlVal<String>(_K.to)!,
      departureDate: formGroup.controlVal<DateTime>(_K.departureDate)!,
      returnDate: formGroup.controlVal<DateTime>(_K.returnDate),
      passengers: formGroup.controlVal<FlightPassengers>(_K.passengers)!,
      travelClass: formGroup.controlVal<TravelClass>(_K.travelClass)!.value,
    );
  }

  @override
  Future<dynamic> sendForm(FlightRequest request) {
    // TODO: implement sendForm
    throw UnimplementedError();
  }
  
}
