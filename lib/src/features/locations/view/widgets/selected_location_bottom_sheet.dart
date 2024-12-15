import 'package:coffee_shop/src/common/widgets/custom_bottom_sheet.dart';
import 'package:coffee_shop/src/common/widgets/custom_text_button.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectedLocationBottomSheet extends StatelessWidget {
  const SelectedLocationBottomSheet({
    super.key,
    required this.location,
    required this.onChooseLocation,
  });

  final LocationModel location;
  final VoidCallback onChooseLocation;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  location.address,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: CustomTextButton(
                  onPressed: onChooseLocation,
                  text: AppLocalizations.of(context)!.choose,
                ),
              ),
            )
          ],
        ),
        height: MediaQuery.sizeOf(context).height * 0.21);
  }
}
