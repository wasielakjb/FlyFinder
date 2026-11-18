part of 'flight_search_result_cubit.dart';

class FlightSearchResultState extends Equatable {
  const FlightSearchResultState._({
    required this.initialized,
    required this.pending,
    required this.request,
    required this.resource,
  });

  factory FlightSearchResultState.initial(FlightRequest resource) =>
      FlightSearchResultState._(
        initialized: false,
        pending: false,
        request: resource,
        resource: null,
      );

  final bool initialized;
  final bool pending;
  final FlightRequest request;
  final List<FlightResource>? resource;

  FlightSearchResultState copyWith({
    bool? initialized,
    bool? pending,
    NullableCopy<FlightRequest>? request,
    NullableCopy<List<FlightResource>>? resource,
  }) {
    return FlightSearchResultState._(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
      request: request.apply(this.request) ?? this.request,
      resource: resource.apply(this.resource),
    );
  }

  @override
  List<Object?> get props => [
    initialized,
    pending,
    request,
    resource,
  ];
}
