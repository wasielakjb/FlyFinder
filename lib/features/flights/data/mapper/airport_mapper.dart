import 'package:flyfinder/features/flights/data/network/network_airport.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';

extension NetworkAirportToEntityMapper on NetworkAirport {
  AirportResource asEntity() => AirportResource(
    code: code,
    name: name,
    city: city,
    country: country,
  );
}
