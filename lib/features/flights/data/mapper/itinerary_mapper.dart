import 'package:flyfinder/features/flights/data/mapper/outbound_mapper.dart';
import 'package:flyfinder/features/flights/data/mapper/price_mapper.dart';
import 'package:flyfinder/features/flights/data/network/network_itinerary.dart';
import 'package:flyfinder/features/flights/domain/model/itinerary.dart';

extension NetworkItineraryToEntityMapper on NetworkItinerary {
  Itinerary asEntity() => Itinerary(
    id: ignavId,
    price: price.asEntity(),
    outbound: outbound.asEntity(),
    cabinClass: cabinClass,
    hasMixedCarriers: hasMixedCarriers,
  );
}
