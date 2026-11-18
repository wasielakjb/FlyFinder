import 'package:awesome_card/extra/card_type.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_price.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_segment.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class AppMocks {
  static PaymentMethodResource get paymentMethod => PaymentMethodResource(
    id: '0',
    number: BoneMock.name,
    name: BoneMock.name,
    type: CardType.masterCard,
    expirationDate: DateTime.now(),
    isActive: false,
  );

  static AirportResource get airportResource => AirportResource(
    code: BoneMock.chars(3),
    name: BoneMock.name,
    city: BoneMock.city,
    country: BoneMock.country,
  );

  static FlightResource get flightResource => FlightResource(
    id: '0',
    price: flightPrice,
    carrier: BoneMock.name,
    duration: Duration.zero,
    flightClass: FlightClass.economy,
    segments: [flightSegment],
  );

  static FlightPrice get flightPrice => FlightPrice(
    amount: 0,
    currency: BoneMock.name,
    status: BoneMock.name,
  );

  static FlightSegment get flightSegment => FlightSegment(
    flightNumber: BoneMock.name,
    operatingCarrierName: BoneMock.name,
    departureAirport: BoneMock.name,
    departureDateTime: DateTime.now(),
    arrivalAirport: BoneMock.name,
    arrivalDateTime: DateTime.now(),
    duration: Duration.zero,
    aircraft: BoneMock.name,
  );
}
