import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/core/domain/misc/app_mocks.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:flyfinder/features/flights/ui/screens/list/cubit/flight_search_result_cubit.dart';
import 'package:flyfinder/features/flights/ui/screens/list/widget/flight_list_tile_wgt.dart';
import 'package:flyfinder/features/flights/ui/screens/list/widget/search_result_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class FlightSearchResultPage extends StatelessWidget
    implements AutoRouteWrapper {
  const FlightSearchResultPage({
    required this.request,
    super.key,
  });

  final FlightRequest request;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightSearchResultCubit(
        repository: inject(),
        request: request,
      ),
      lazy: false,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchResultCubit, FlightSearchResultState>(
      builder: (context, state) => Scaffold(
        backgroundColor: context.surfaceContainer,
        body: CustomScrollView(
          slivers: [
            SearchResultAppBar(request),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: Skeletonizer.sliver(
                enabled: !state.initialized,
                child: SliverList.separated(
                  itemCount: state.resource?.length ?? 5,
                  itemBuilder: (context, index) => FlightListTileWidget(
                    item: state.resource?[index] ?? AppMocks.flightResource,
                  ),
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
