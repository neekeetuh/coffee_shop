import 'package:coffee_shop/src/features/locations/view/map_screen.dart';
import 'package:coffee_shop/src/features/locations/view/widgets/selected_location_bottom_sheet.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';

class SelectedLocationSliver extends StatelessWidget {
  const SelectedLocationSliver({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MapScreen()),
          );
          showModalBottomSheet(
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) => const SelectedLocationBottomSheet());
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
                location,
              )
            ],
          ),
        ),
      ),
    );
  }
}
