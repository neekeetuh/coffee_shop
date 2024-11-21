import 'package:coffee_shop/src/features/locations/view/widgets/location_tile.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => const LocationTile(
            location: 'Ленина, 15',
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        ),
      ),
    );
  }
}
