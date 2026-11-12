import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';

class AirportLocationListTileWidget extends StatelessWidget {
  const AirportLocationListTileWidget({
    required this.onTap,
    required this.item,
    super.key,
  });

  final void Function(AirportResource) onTap;
  final AirportResource item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(item),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.code,
              style: context.titleMedium,
            ),
            Text(
              '${item.name} (${item.city}, ${item.country})',
              style: context.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
