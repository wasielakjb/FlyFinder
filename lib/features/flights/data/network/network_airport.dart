import 'package:flyfinder/core/domain/model/json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_airport.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkAirport {
  const NetworkAirport({
    required this.code,
    required this.name,
    required this.city,
    required this.country,
  });

  factory NetworkAirport.fromJson(Json json) => _$NetworkAirportFromJson(json);

  final String code;
  final String name;
  final String city;
  final String country;

  Json toJson() => _$NetworkAirportToJson(this);
}
