import 'package:coffee_shop/src/common/widgets/custom_icon_button.dart';
import 'package:coffee_shop/src/features/locations/bloc/locations_bloc.dart';
import 'package:coffee_shop/src/features/locations/view/locations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Placeholder(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.map_outlined,
                    onTap: () {
                      _onPressLocationsButton(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressLocationsButton(BuildContext context) {
    final locationsBloc = context.read<LocationsBloc>();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: locationsBloc,
                child: const LocationsScreen(),
              )),
    );
  }
}
