import 'package:coffee_shop/src/features/locations/data/locations_repository.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc({required ILocationsRepository locationsRepository})
      : _locationsRepository = locationsRepository,
        super(const IdleLocationsState()) {
    on<LocationsEvent>((event, emit) async {
      switch (event) {
        case LoadLocationsEvent():
          await _onLoadLocations(event, emit);
        case SetLocationEvent():
          await _onSetLocation(event, emit);
      }
    });
  }

  final ILocationsRepository _locationsRepository;

  Future<void> _onLoadLocations(
      LoadLocationsEvent event, Emitter<LocationsState> emit) async {
    emit(LoadingLocationsState(
        locations: state.locations, selectedLocation: state.selectedLocation));
    try {
      final locations = await _locationsRepository.loadLocations();
      LocationModel? selectedLocation =
          await _locationsRepository.fetchSelectedLocation();
      selectedLocation ??= locations[0];
      emit(SuccessfulLocationsState(
          locations: locations, selectedLocation: selectedLocation));
    } on Exception catch (e) {
      emit(ErrorLocationsState(
          locations: state.locations,
          selectedLocation: state.selectedLocation,
          error: e));
    } finally {
      emit(IdleLocationsState(
          locations: state.locations,
          selectedLocation: state.selectedLocation));
    }
  }

  Future<void> _onSetLocation(
      SetLocationEvent event, Emitter<LocationsState> emit) async {
    emit(LoadingLocationsState(
        locations: state.locations, selectedLocation: state.selectedLocation));
    try {
      await _locationsRepository.setSelectedLocation(event.location);
      emit(SuccessfulLocationsState(
          locations: state.locations, selectedLocation: event.location));
    } catch (e) {
      emit(ErrorLocationsState(error: e));
    } finally {
      emit(IdleLocationsState(
          locations: state.locations,
          selectedLocation: state.selectedLocation));
    }
  }
}
