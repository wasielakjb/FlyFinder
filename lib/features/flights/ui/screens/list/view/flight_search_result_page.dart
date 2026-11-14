import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:flyfinder/features/flights/ui/screens/list/cubit/flight_search_result_cubit.dart';

@RoutePage()
class FlightSearchResultPage extends StatelessWidget
    implements AutoRouteWrapper {
  const FlightSearchResultPage({
    required this.request,
    super.key,
  });

  final FlightRequest request;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightSearchResultCubit(
        repository: inject(),
        request: request,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
