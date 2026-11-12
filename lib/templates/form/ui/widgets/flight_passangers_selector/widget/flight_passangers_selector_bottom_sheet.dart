import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/templates/form/ui/widgets/flight_passangers_selector/widget/flight_passangers_list_tile_wgt.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:flyfinder/templates/layout/sheet_header.dart';

class FlightPassangersSelectorBottomSheet extends StatefulWidget {
  const FlightPassangersSelectorBottomSheet._(this.initalValue);

  final FlightPassengers? initalValue;

  static Future<FlightPassengers?> show(
    BuildContext context, {
    required FlightPassengers? value,
  }) async {
    return showModalBottomSheet<FlightPassengers>(
      context: context,
      builder: (_) => FlightPassangersSelectorBottomSheet._(value),
    );
  }

  @override
  State<FlightPassangersSelectorBottomSheet> createState() =>
      _FlightPassangersSelectorBottomSheetState();
}

class _FlightPassangersSelectorBottomSheetState
    extends State<FlightPassangersSelectorBottomSheet> {
  late FlightPassengers currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initalValue ?? const FlightPassengers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetHeader('Passangers'),
          FlightPassangersListTileWgt(
            initalValue: currentValue.adults,
            onChange: (value) => setState(
              () => currentValue = currentValue.copyWith(adults: value),
            ),
            title: 'Adult',
          ),
          FlightPassangersListTileWgt(
            initalValue: currentValue.children,
            onChange: (value) => setState(
              () => currentValue = currentValue.copyWith(children: value),
            ),
            title: 'Children',
            subtitle: '2–11 years at time of travel',
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              onPressed: () =>
                  context.maybePop(currentValue.total != 0 ? currentValue : null),
              child: const AnyButtonContent(text: 'Confirmation'),
            ),
          ),
        ],
      ),
    );
  }
}
