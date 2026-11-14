part of 'flights_form_cubit.dart';

class FlightsFormState extends Equatable {
  const FlightsFormState._({
    required this.initialized,
    required this.pending,
  });

  factory FlightsFormState.inital() => const FlightsFormState._(
    initialized: false,
    pending: false,
  );

  final bool initialized;
  final bool pending;

  FlightsFormState copyWith({
    bool? initialized,
    bool? pending,
  }) {
    return FlightsFormState._(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
    );
  }

  @override
  List<Object?> get props => [
    initialized,
    pending,
  ];
}
