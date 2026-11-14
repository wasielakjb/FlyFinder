import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/repository/flights_repository.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'flight_search_result_state.dart';

class FlightSearchResultCubit extends Cubit<FlightSearchResultState> {
  FlightSearchResultCubit({
    required this.request,
    required this.repository,
  }) : super(const FlightSearchResultState.initial());

  @protected
  final FlightRequest request;

  @protected
  final FlightsRepository repository;
}
