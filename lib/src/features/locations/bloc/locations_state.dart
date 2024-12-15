part of 'locations_bloc.dart';

sealed class LocationsState {
  final List<LocationModel>? locations;
  final LocationModel? selectedLocation;
  const LocationsState({
    this.locations,
    this.selectedLocation,
  });
}

final class IdleLocationsState extends LocationsState {
  const IdleLocationsState({
    super.locations,
    super.selectedLocation,
  });
}

final class LoadingLocationsState extends LocationsState {
  const LoadingLocationsState({
    super.locations,
    super.selectedLocation,
  });
}

final class SuccessfulLocationsState extends LocationsState {
  const SuccessfulLocationsState({
    super.locations,
    super.selectedLocation,
  });
}

final class ErrorLocationsState extends LocationsState {
  final Object error;
  const ErrorLocationsState({
    required this.error,
    super.locations,
    super.selectedLocation,
  });
}
