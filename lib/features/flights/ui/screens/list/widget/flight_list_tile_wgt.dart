import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FlightListTileWidget extends StatelessWidget {
  const FlightListTileWidget({
    required this.item,
    super.key,
  });

  final FlightResource item;

  @override
  Widget build(BuildContext context) {
    final segment = item.segments.first;
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 12,
                children: [
                  Skeleton.leaf(
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.secondaryContainer,
                      ),
                      child: RotatedBox(
                        quarterTurns: 4,
                        child: Icon(
                          Icons.flight,
                          color: context.primary,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        segment.operatingCarrierName ?? '-',
                        style: context.bodyMediumBold,
                      ),
                      Text(
                        'Flight Numer ${segment.flightNumber}',
                        style: context.bodySmallBold.copyWith(
                          color: context.outline,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Skeleton.leaf(
                    child: Chip(
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.green.withValues(alpha: 0.2),
                      label: Text(
                        'Direct',
                        style: context.labelSmall.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('hh:mm').format(segment.departureDateTime),
                          style: context.headlineSmall,
                        ),
                        Text(
                          segment.departureAirport,
                          style: context.bodyLargeBold.copyWith(
                            color: context.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Skeleton.ignore(
                      child: Column(
                        spacing: 4,
                        children: [
                          Text(
                            segment.duration.label,
                            style: context.bodySmallBold.copyWith(
                              color: context.outline,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DottedLine(dashColor: context.outline),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.flight,
                                  size: 20,
                                  color: context.outline,
                                ),
                              ),
                              Expanded(
                                child: DottedLine(dashColor: context.outline),
                              ),
                            ],
                          ),
                          Text(
                            'Non-stop',
                            style: context.bodySmallBold.copyWith(
                              color: context.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('hh:mm').format(segment.arrivalDateTime),
                          style: context.headlineSmall,
                        ),
                        Text(
                          segment.arrivalAirport,
                          style: context.bodyLargeBold.copyWith(
                            color: context.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Skeleton.ignore(
                child: DottedLine(
                  dashGapLength: 6,
                  dashLength: 5,
                  dashColor: context.surfaceContainerHighest,
                ),
              ),
              Row(
                spacing: 8,
                children: [
                  Skeleton.leaf(
                    child: Chip(
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      backgroundColor: context.surfaceContainer,
                      label: Text(
                        DateFormat(
                          'MMM dd, yyyy',
                        ).format(segment.departureDateTime),
                        style: context.labelSmall,
                      ),
                    ),
                  ),
                  Skeleton.leaf(
                    child: Chip(
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      backgroundColor: context.surfaceContainer,
                      label: Text(
                        item.flightClass.resolveLabel(),
                        style: context.labelSmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.price.label,
                      style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.primary,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Duration {
  String get label {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);

    if (hours == 0) return '${minutes}m';
    if (minutes == 0) return '${hours}h';

    return '${hours}h ${minutes}m';
  }
}
