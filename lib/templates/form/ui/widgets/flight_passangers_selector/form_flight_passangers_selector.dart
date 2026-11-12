import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/form/ui/widgets/flight_passangers_selector/widget/flight_passangers_selector_bottom_sheet.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormFlightPassangersSelector extends StatelessWidget {
  FormFlightPassangersSelector({
    required this.formControlName,
    required this.placeholder,
    this.validationMessages,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveFormField<FlightPassengers, FlightPassengers>(
          formControlName: formControlName,
          builder: (field) => InkWell(
            onTap: () async {
              final res = await FlightPassangersSelectorBottomSheet.show(
                context,
                value: field.value,
              );
              if (res != null) {
                field.didChange(res);
              }
            },
            child: InputDecorator(
              isEmpty: field.value == null,
              decoration: InputDecoration(
                hintText: placeholder,
                errorMaxLines: 2,
                errorText: field.errorText,
              ),
              child: field.value != null
                  ? Row(
                      children: [
                        const Icon(Icons.person, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          field.value!.adults.toString(),
                          style: context.bodyLarge.copyWith(fontSize: 16),
                        ),
                        const Spacer(),
                        if (field.value!.children != 0) ...[
                          const Icon(Icons.person_outline, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            field.value!.children.toString(),
                            style: context.bodyLarge.copyWith(fontSize: 16),
                          ),
                        ],
                      ],
                    )
                  : null,
              // child: field.value != null
              //     ? Text(
              //         '${field.value!.total} passangers',
              //         style: context.bodyLarge.copyWith(fontSize: 16),
              //       )
              //     : null,
            ),
          ),
        ),
      ),
    );
  }
}
