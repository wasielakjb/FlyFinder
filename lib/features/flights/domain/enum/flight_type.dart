enum FlightType {
  oneWay,
  roundTrip;

  String resolveLabel() => switch (this) {
    oneWay => 'One-way',
    roundTrip => 'Round-trip',
  };
}
