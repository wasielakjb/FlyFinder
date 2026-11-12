import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';

class CabinClassPickerBottomSheet extends StatelessWidget {
  const CabinClassPickerBottomSheet._({
    required this.initalValue,
  });

  final CabinClass? initalValue;

  static Future<CabinClass?> show(
    BuildContext context, {
    required CabinClass? value,
  }) async {
    return showModalBottomSheet<CabinClass>(
      context: context,
      builder: (context) => CabinClassPickerBottomSheet._(
        initalValue: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: context.maybePop,
                icon: const Icon(Icons.close),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 42),
                  child: Text('Class', style: context.titleMedium),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: CabinClass.values.length,
          itemBuilder: (context, index) {
            final item = CabinClass.values[index];
            return InkWell(
              onTap: () => context.maybePop(item),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.resolveLabel(),
                        style: item == initalValue
                            ? context.titleSmall.copyWith(
                                color: context.primary,
                              )
                            : context.bodyMedium,
                      ),
                    ),
                    if (item == initalValue)
                      Icon(
                        Icons.check_circle,
                        color: context.primary,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
