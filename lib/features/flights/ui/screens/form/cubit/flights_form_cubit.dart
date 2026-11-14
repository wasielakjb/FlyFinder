import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_type.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:flyfinder/features/flights/ui/screens/form/form_builders/flight_fg_factory.dart';
import 'package:flyfinder/features/flights/ui/screens/form/form_builders/flight_form_keys.dart';
import 'package:flyfinder/templates/form/models/form_value_change.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

part 'flights_form_state.dart';

typedef _K = FlightFormKeys;

class FlightsFormCubit extends Cubit<FlightsFormState> {
  FlightsFormCubit() : super(FlightsFormState.inital()) {
    init();
  }

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  void init() {
    _formGroup = FlightFormGroupFactory.create;
    formGroup.valueChanges.startWith(_formGroup!.value).pairwise().listen(
      (value) {
        onFormValueChanged(FormChange(value.nonNulls.toList()));
      },
    );
    emit(state.copyWith(initialized: true));
  }

  void toggleAirports() {
    formGroup.swapVal(_K.origin, _K.destination);
  }

  Future<void> submit(BuildContext context) async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;

    final request = await mapBeforeSubmit();

    formGroup
      ..markAsPristine()
      ..markAsUntouched();
    
    if (!context.mounted) return;
    await context.pushRoute(FlightSearchResultRoute(request: request));
  }

  @protected
  void onFormValueChanged(FormChange changes) {
    final type = changes.get<FlightType>(_K.type);
    final returnDate = formGroup.controlX<DateTime>(_K.returnDate);
    if (!type.changed) return;
    if (type.current == FlightType.roundTrip) {
      returnDate.setValidators([Validators.required]);
    } else {
      returnDate
        ..setValidators([])
        ..reset();
    }
    returnDate.updateValueAndValidity();
    formGroup.markAsUntouched();
  }

  Future<FlightRequest> mapBeforeSubmit() async {
    final passengers = formGroup.controlVal<FlightPassengers>(_K.passengers)!;
    return FlightRequest(
      origin: formGroup.controlVal<AirportResource>(_K.origin)!.code,
      destination: formGroup.controlVal<AirportResource>(_K.destination)!.code,
      departureDate: formGroup
          .controlVal<DateTime>(_K.departureDate)!
          .toApiFormat(),
      returnDate: formGroup.controlVal<DateTime>(_K.returnDate)?.toApiFormat(),
      flightClass: formGroup.controlVal<FlightClass>(_K.flightClass)!,
      adults: passengers.adults,
      children: passengers.children,
    );
  }
}

extension on DateTime {
  String toApiFormat() => DateFormat('yyyy-MM-dd').format(this);
}
