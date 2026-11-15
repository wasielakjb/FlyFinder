import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultAppBar extends StatelessWidget {
  const SearchResultAppBar(this.request, {super.key});

  final FlightRequest request;

  double get expandedHeight => 180;

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - kToolbarHeight) /
        (expandedHeight - kToolbarHeight);

    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;

    return expandRatio;
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: context.surfaceContainer,
      expandedHeight: expandedHeight,
      elevation: 12,
      flexibleSpace: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final expandRatio = _calculateExpandRatio(constraints);
            final animation = AlwaysStoppedAnimation(expandRatio);

            return Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                AppBarExtendedTitle(
                  origin: request.origin.city,
                  destination: request.destination.city,
                  departureDate: request.departureDate,
                  returnDate: request.returnDate,
                  passengersAmount: request.adults + request.children,
                  flightClass: request.flightClass,
                  animation: animation,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: AppBarCollapsedTitle(
                    animation: animation,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AppBarExtendedTitle extends StatelessWidget {
  const AppBarExtendedTitle({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.passengersAmount,
    required this.flightClass,
    required this.animation,
    this.returnDate,
    super.key,
  });

  final String origin;
  final String destination;
  final DateTime departureDate;
  final DateTime? returnDate;
  final int passengersAmount;
  final FlightClass flightClass;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(0.3, 1, curve: Curves.easeIn),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(origin, style: context.displaySmall),
                  Text(
                    'to',
                    style: context.displaySmall.copyWith(color: context.outline),
                  ),
                  Text(destination, style: context.displaySmall),
                ],
              ),
              Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    departureDate.toFlightDateFormat(returnDate),
                    style: context.labelLarge,
                  ),
                  Icon(
                    Icons.circle,
                    size: 5,
                    color: context.outline,
                  ),
                  Text(passengersAmount.label, style: context.labelLarge),
                  Icon(
                    Icons.circle,
                    size: 5,
                    color: context.outline,
                  ),
                  Text(flightClass.resolveLabel(), style: context.labelLarge),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarCollapsedTitle extends StatelessWidget {
  const AppBarCollapsedTitle({
    required this.animation,
    super.key,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: Row(
          children: [
            const Skeleton.keep(child: BackButton()),
            Expanded(
              child: FadeTransition(
                opacity: Tween<double>(begin: 1, end: 0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: const Interval(0, 0.7, curve: Curves.easeOut),
                  ),
                ),
                child: Align(
                  child: Text(
                    'Select Flight',
                    style: context.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

extension on DateTime {
  String toFlightDateFormat(DateTime? returnDate) {
    final dateFormat = DateFormat('dd MMM');
    final yearFormat = DateFormat('yyyy');

    final departure = dateFormat.format(this);
    if (returnDate == null) {
      return '$departure ${yearFormat.format(this)}';
    }

    final destination = dateFormat.format(returnDate);
    if (year == returnDate.year) {
      return '$departure - $destination ${yearFormat.format(this)}';
    }

    return '$departure ${yearFormat.format(this)} - '
        '$destination ${yearFormat.format(returnDate)}';
  }
}

extension on int {
  String get label => this == 1 ? '$this Passenger' : '$this Passengers';
}
