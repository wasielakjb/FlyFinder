import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/core/domain/misc/app_mocks.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/repository/flights_repository.dart';
import 'package:flyfinder/templates/layout/app_status_wgt.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FlightRouteBottomSheet extends StatefulWidget {
  const FlightRouteBottomSheet._();

  static Future<AirportResource?> show(BuildContext context) async {
    return showModalBottomSheet<AirportResource>(
      context: context,
      showDragHandle: true,
      builder: (_) => const SafeArea(
        bottom: false,
        child: FlightRouteBottomSheet._(),
      ),
    );
  }

  @override
  State<FlightRouteBottomSheet> createState() => _FlightRouteBottomSheetState();
}

class _FlightRouteBottomSheetState extends State<FlightRouteBottomSheet> {
  List<AirportResource>? airports;
  FlightsRepository repository = inject();
  TextEditingController controller = TextEditingController();

  Future<void> onChanged(String value) async {
    airports = value.isNotEmpty && value.length > 1
        ? await repository.getAirports(value)
        : null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchBar(
            controller: controller,
            onChanged: onChanged,
            leading: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(Icons.search, color: context.outline),
            ),
            hintText: 'Search by airport, city or country',
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (controller.text.isEmpty) return const SizedBox();
              if (airports?.isEmpty ?? false) {
                return Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: AppStatusWidget(
                    icon: Icons.folder_off_outlined,
                    text: 'No results',
                    content: Text(
                      'Try another airport, city or country.',
                      style: context.labelLarge,
                    ),
                  ),
                );
              }

              return Skeletonizer(
                enabled: controller.text.length < 2,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: airports?.length ?? 5,
                  itemBuilder: (context, index) {
                    final item = airports?[index] ?? AppMocks.airportResource;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      onTap: () => context.maybePop(item),
                      title: Text(item.code),
                      subtitle: Text(
                        '${item.name} (${item.city}, ${item.country})',
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
