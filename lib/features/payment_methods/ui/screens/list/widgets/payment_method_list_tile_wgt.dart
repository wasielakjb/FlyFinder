import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/extra/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentMethodListTileWidget extends StatelessWidget {
  const PaymentMethodListTileWidget(
    this.item, {
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final PaymentMethodResource item;
  final void Function(PaymentMethodResource) onEdit;
  final void Function(PaymentMethodResource) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.4,
        children: [
          SlidableAction(
            onPressed: (c) => onEdit.call(item),
            backgroundColor: context.surfaceContainer,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (c) => onDelete.call(item),
            backgroundColor: context.error,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          spacing: 16,
          children: [
            Skeleton.leaf(
              child: Container(
                height: 32,
                color: item.type == CardType.visa ? context.primary : null,
                child: getCardTypeIcon(cardType: item.type),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•••• •••• •••• ${item.number}',
                    style: context.titleMedium,
                  ),
                  Text(
                    item.expirationDate.toCardFormat,
                    style: context.bodyMedium,
                  ),
                ],
              ),
            ),
            if (item.isActive)
              Icon(
                Icons.check_circle,
                color: context.primary,
              ),
          ],
        ),
      ),
    );
  }
}

extension on DateTime {
  String get toCardFormat {
    if (DateTime.now().isAfter(this)) return 'Card expired';

    final month = this.month.toString().padLeft(2, '0');
    final year = (this.year % 100).toString().padLeft(2, '0');
    return '$month/$year';
  }
}
