part of 'locations_bloc.dart';

sealed class LocationsEvent {
  const LocationsEvent();
}

final class LoadLocationsEvent extends LocationsEvent {
  const LoadLocationsEvent();
}

final class SetLocationEvent extends LocationsEvent {
  final LocationModel location;
  const SetLocationEvent({
    required this.location,
  });
}
