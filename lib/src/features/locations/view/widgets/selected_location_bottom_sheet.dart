import 'package:coffee_shop/src/common/widgets/custom_bottom_sheet.dart';
import 'package:coffee_shop/src/common/widgets/custom_text_button.dart';
import 'package:coffee_shop/src/features/locations/bloc/locations_bloc.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedLocationBottomSheet extends StatelessWidget {
  const SelectedLocationBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  BlocSelector<LocationsBloc, LocationsState, LocationModel?>(
                selector: (state) => state.selectedLocation,
                builder: (context, selectedLocation) {
                  return Text(
                    selectedLocation?.address ?? 'Адрес не выбран',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextButton(onPressed: () {}, text: 'Выбрать'),
            )
          ],
        ),
        height: MediaQuery.sizeOf(context).height * 0.2);
  }
}
