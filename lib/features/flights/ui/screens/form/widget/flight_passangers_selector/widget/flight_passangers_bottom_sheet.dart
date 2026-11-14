import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';

class FlightPassangersBottomSheet extends StatefulWidget {
  const FlightPassangersBottomSheet._(this.initalValue);

  final FlightPassengers? initalValue;

  static Future<FlightPassengers?> show(
    BuildContext context, {
    FlightPassengers? value,
  }) async {
    return showModalBottomSheet<FlightPassengers>(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: FlightPassangersBottomSheet._(value),
      ),
    );
  }

  @override
  State<FlightPassangersBottomSheet> createState() =>
      _FlightPassangersBottomSheetState();
}

class _FlightPassangersBottomSheetState
    extends State<FlightPassangersBottomSheet> {
  late FlightPassengers passengers;

  @override
  void initState() {
    passengers = widget.initalValue ?? const FlightPassengers();
    super.initState();
  }

  void _updatePassengers(FlightPassengers value) {
    setState(() => passengers = value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: const Text('Adult'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
                onPressed: passengers.adults > 0
                    ? () => _updatePassengers(
                        passengers.copyWith(adults: passengers.adults - 1),
                      )
                    : null,
                icon: const Icon(Icons.remove, size: 18),
              ),
              Container(
                width: 16,
                alignment: Alignment.center,
                child: Text(
                  '${passengers.adults}',
                  style: context.titleSmall,
                ),
              ),
              IconButton.filled(
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
                onPressed: passengers.adults < 9
                    ? () => _updatePassengers(
                        passengers.copyWith(adults: passengers.adults + 1),
                      )
                    : null,
                icon: Icon(Icons.add, color: context.surface, size: 18),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text('Children'),
          subtitle: const Text('2–11 years at time of travel'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
                onPressed: passengers.children > 0
                    ? () => _updatePassengers(
                        passengers.copyWith(children: passengers.children - 1),
                      )
                    : null,
                icon: const Icon(Icons.remove, size: 18),
              ),
              Container(
                width: 16,
                alignment: Alignment.center,
                child: Text(
                  '${passengers.children}',
                  style: context.titleSmall,
                ),
              ),
              IconButton.filled(
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
                onPressed: passengers.children < 9
                    ? () => _updatePassengers(
                        passengers.copyWith(children: passengers.children + 1),
                      )
                    : null,
                icon: Icon(Icons.add, color: context.surface, size: 18),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FilledButton(
            onPressed: () => context.maybePop(
              passengers.total != 0 ? passengers : null,
            ),
            child: const AnyButtonContent(text: 'Confirm'),
          ),
        ),
      ],
    );
  }
}
