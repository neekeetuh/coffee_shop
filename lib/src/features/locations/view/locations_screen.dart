import 'package:coffee_shop/src/features/locations/bloc/locations_bloc.dart';
import 'package:coffee_shop/src/features/locations/view/widgets/location_tile.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocationsBloc>().add(const LoadLocationsEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Наши кофейни',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: AppColors.grey,
                thickness: 1,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<LocationsBloc, LocationsState>(
          builder: (context, state) {
            if (state is LoadingLocationsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final locations = state.locations ?? [];
            return ListView.separated(
              itemCount: locations.length,
              itemBuilder: (context, index) => LocationTile(
                location: locations[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
            );
          },
        ),
      ),
    );
  }
}
