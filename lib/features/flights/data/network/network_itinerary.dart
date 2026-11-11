import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/features/flights/data/network/network_outbound.dart';
import 'package:flyfinder/features/flights/data/network/network_price.dart';
import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_itinerary.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkItinerary {
  const NetworkItinerary({
    required this.ignavId,
    required this.price,
    required this.outbound,
    required this.cabinClass,
    required this.hasMixedCarriers,
  });

  factory NetworkItinerary.fromJson(Json json) =>
      _$NetworkItineraryFromJson(json);

  final String ignavId;
  final NetworkPrice price;
  final NetworkOutbound outbound;
  final CabinClass cabinClass;
  final bool hasMixedCarriers;

  Json toJson() => _$NetworkItineraryToJson(this);
}
