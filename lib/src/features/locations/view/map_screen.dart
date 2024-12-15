import 'dart:async';

import 'package:coffee_shop/src/common/utils/snack_bar_service.dart';
import 'package:coffee_shop/src/common/widgets/custom_icon_button.dart';
import 'package:coffee_shop/src/features/locations/bloc/locations_bloc.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:coffee_shop/src/features/locations/services/locations_service.dart';
import 'package:coffee_shop/src/features/locations/view/locations_screen.dart';
import 'package:coffee_shop/src/features/locations/view/widgets/selected_location_bottom_sheet.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  Widget build(BuildContext context) {
    List<MapObject> mapObjects = context
            .read<LocationsBloc>()
            .state
            .locations
            ?.map((location) => PlacemarkMapObject(
                  onTap: (object, point) {
                    final locationsBloc = context.read<LocationsBloc>();
                    showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) => SelectedLocationBottomSheet(
                              onChooseLocation: () {
                                locationsBloc
                                    .add(SetLocationEvent(location: location));
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                              location: location,
                            ));
                  },
                  mapId: MapObjectId(location.address),
                  point: Point(
                      latitude: location.latitude,
                      longitude: location.longitude),
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage(
                        ImageSources.placemark,
                      ),
                    ),
                  ),
                  opacity: 1,
                ))
            .toList() ??
        [];
    LocationModel? lastSelectedLocation =
        context.read<LocationsBloc>().state.selectedLocation ??
            context.read<LocationsBloc>().state.locations?[0];
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            mapObjects: mapObjects,
            onMapCreated: (controller) async {
              mapControllerCompleter.complete(controller);
              LocationData? currentLocation;
              try {
                currentLocation = await LocationsService().getLocation();
              } on Exception catch (_) {
                onGetLocationError();
                return;
              }
              if (currentLocation == null) {
                if (lastSelectedLocation == null) return;
                _moveCameraTo(
                  point: Point(
                      latitude: lastSelectedLocation.latitude,
                      longitude: lastSelectedLocation.longitude),
                );
                return;
              }
              _moveCameraTo(
                point: Point(
                    latitude: currentLocation.latitude!,
                    longitude: currentLocation.longitude!),
              );
            },
          ),
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

  Future<void> _moveCameraTo({required Point point, double zoom = 15}) async {
    (await (mapControllerCompleter.future)).moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: point,
          zoom: zoom,
        )),
        animation: const MapAnimation(duration: 2));
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

  void onGetLocationError() {
    SnackBarService.showSnackBar(
        context, AppLocalizations.of(context)!.getLocationErrorMessage);
  }
}
