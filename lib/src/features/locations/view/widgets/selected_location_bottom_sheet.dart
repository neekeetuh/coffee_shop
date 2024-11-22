import 'package:coffee_shop/src/common/widgets/custom_bottom_sheet.dart';
import 'package:coffee_shop/src/common/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Ленина, 15',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
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
