import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';

class FlightClassBottomSheet extends StatelessWidget {
  const FlightClassBottomSheet._(this.initalValue);

  final FlightClass? initalValue;

  static Future<FlightClass?> show(
    BuildContext context, {
    FlightClass? value,
  }) async {
    return showModalBottomSheet<FlightClass>(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: FlightClassBottomSheet._(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: FlightClass.values.length,
      itemBuilder: (context, index) {
        final item = FlightClass.values[index];
        return ListTile(
          onTap: () => context.maybePop(item),
          selected: item == initalValue,
          title: Text(item.resolveLabel()),
          trailing: item == initalValue ? const Icon(Icons.check_circle) : null,
        );
      },
    );
  }
}
