import 'package:coffee_shop/src/common/utils/snack_bar_service.dart';
import 'package:coffee_shop/src/common/widgets/custom_text_button.dart';
import 'package:coffee_shop/src/features/menu/bloc/menu_bloc.dart';
import 'package:coffee_shop/src/features/menu/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is OrderState) {
          if (state.isSuccessful == true) {
            context.read<CartProvider>().clearCart();
            Navigator.of(context).pop();
            SnackBarService.showSnackBar(
                context, AppLocalizations.of(context)!.orderCreated);
          } else {
            SnackBarService.showSnackBar(
                context, AppLocalizations.of(context)!.makeOrderErrorMessage);
          }
        }
      },
      child: CustomTextButton(
        text: AppLocalizations.of(context)!.makeOrder,
        onPressed: () => _onPressed(context),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    context
        .read<MenuBloc>()
        .add(MakeOrderEvent(orderMap: context.read<CartProvider>().itemsMap));
  }
}
