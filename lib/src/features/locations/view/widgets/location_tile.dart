import 'package:coffee_shop/src/features/locations/bloc/locations_bloc.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.location,
  });

  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<LocationsBloc>().add(SetLocationEvent(location: location));
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(location.address),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
