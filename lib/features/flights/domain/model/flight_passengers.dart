import 'package:equatable/equatable.dart';

class FlightPassengers extends Equatable {
  const FlightPassengers({
    this.adults = 1,
    this.children = 0,
  });

  final int adults;
  final int children;

  int get total => adults + children;

  FlightPassengers copyWith({
    int? adults,
    int? children,
  }) {
    return FlightPassengers(
      adults: adults ?? this.adults,
      children: children ?? this.children,
    );
  }

  @override
  List<Object?> get props => [
    adults,
    children,
  ];
}
