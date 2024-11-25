import 'package:coffee_shop/src/features/locations/bloc/locations_bloc.dart';
import 'package:coffee_shop/src/features/locations/view/map_screen.dart';
import 'package:coffee_shop/src/features/locations/view/widgets/selected_location_bottom_sheet.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedLocationSliver extends StatelessWidget {
  const SelectedLocationSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locationsBloc = context.read<LocationsBloc>();
    final selectedLocation =
        context.select((LocationsBloc bloc) => bloc.state.selectedLocation);
    return SliverToBoxAdapter(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: locationsBloc,
                child: const MapScreen(),
              ),
            ),
          );
          showModalBottomSheet(
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) => BlocProvider.value(
                    value: locationsBloc,
                    child: const SelectedLocationBottomSheet(),
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            children: [
              Image.asset(
                ImageSources.locationIcon,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 10),
              Text(
                selectedLocation?.address ?? 'Адрес не выбран',
              )
            ],
          ),
        ),
      ),
    );
  }
}
