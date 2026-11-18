import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/core/domain/model/nullable_copy.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';
import 'package:flyfinder/features/flights/domain/repository/flights_repository.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'flight_search_result_state.dart';

class FlightSearchResultCubit extends Cubit<FlightSearchResultState> {
  FlightSearchResultCubit({
    required FlightRequest request,
    required this.repository,
  }) : super(FlightSearchResultState.initial(request)) {
    unawaited(init());
  }

  @protected
  final FlightsRepository repository;

  Future<void> init() async {
    final resource = await repository.getOneWayFlights(state.request);
    emit(state.copyWith(resource: () => resource, initialized: true));
  }
}
