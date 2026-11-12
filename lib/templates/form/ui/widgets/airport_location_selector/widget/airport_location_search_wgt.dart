import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/repository/flights_repository.dart';
import 'package:flyfinder/templates/form/ui/widgets/airport_location_selector/widget/airport_location_list_tile_wgt.dart';
import 'package:flyfinder/templates/layout/app_status_wgt.dart';

class AirportLocationSearchWidget extends StatefulWidget {
  const AirportLocationSearchWidget({required this.onChanged, super.key});

  final void Function(AirportResource) onChanged;

  @override
  State<AirportLocationSearchWidget> createState() =>
      _AirportLocationSearchWidgetState();
}

class _AirportLocationSearchWidgetState
    extends State<AirportLocationSearchWidget> {
  List<AirportResource> currentValue = [];
  late TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  Future<void> onChanged(String value) async {
    if (value.isEmpty || value.length < 2) {
      setState(() => currentValue = []);
      return;
    }
    final repository = inject<FlightsRepository>();
    final result = await repository.getAirports(value);
    setState(() => currentValue = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SearchBar(
                controller: controller,
                onChanged: onChanged,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(Icons.search, color: context.outline),
                ),
                hintText: 'Country, City or Airport',
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (currentValue.isEmpty &&
                      (controller?.text.isNotEmpty ?? false)) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: AppStatusWidget(
                        icon: Icons.folder_off,
                        text: 'No results',
                        content: Text(
                          "We have loaded a list, but it's empty.",
                          style: context.labelLarge,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: currentValue.length,
                    itemBuilder: (context, index) =>
                        AirportLocationListTileWidget(
                          onTap: (value) async {
                            widget.onChanged.call(value);
                            await context.maybePop();
                          },
                          item: currentValue[index],
                        ),
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
