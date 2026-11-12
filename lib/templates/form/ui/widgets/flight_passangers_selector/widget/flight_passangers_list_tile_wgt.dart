import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class FlightPassangersListTileWgt extends StatefulWidget {
  const FlightPassangersListTileWgt({
    required this.onChange,
    required this.initalValue,
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;
  final void Function(int) onChange;
  final int? initalValue;

  @override
  State<FlightPassangersListTileWgt> createState() =>
      _FlightPassangersListTileWidgetState();
}

class _FlightPassangersListTileWidgetState
    extends State<FlightPassangersListTileWgt> {
  late int amount;

  @override
  void initState() {
    amount = widget.initalValue ?? 0;
    super.initState();
  }

  void _updateAmount(int value) {
    setState(() => amount = value);
    widget.onChange(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: context.titleSmall,
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle!,
                    style: context.labelMedium.copyWith(color: context.outline),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: context.surfaceContainerHighest,
                  foregroundColor: context.outline,
                ),
                iconSize: 16,
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
                onPressed: amount > 0 ? () => _updateAmount(amount - 1) : null,
                icon: const Icon(Icons.remove),
              ),
              Container(
                width: 16,
                alignment: Alignment.center,
                child: Text(amount.toString(), style: context.titleSmall),
              ),
              IconButton.filled(
                iconSize: 16,
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
                onPressed: amount < 9 ? () => _updateAmount(amount + 1) : null,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
