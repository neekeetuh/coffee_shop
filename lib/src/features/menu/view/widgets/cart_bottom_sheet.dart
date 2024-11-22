import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/src/common/widgets/custom_bottom_sheet.dart';
import 'package:coffee_shop/src/features/menu/providers/cart_provider.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/make_order_button.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvier = context.watch<CartProvider>();
    return CustomBottomSheet(
        height: MediaQuery.of(context).size.height * 0.9,
        content: Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.grey)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ваш заказ',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartProvider>().clearCart();
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        ImageSources.recycleBinIcon,
                        height: 24,
                        width: 24,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: cartProvier.items.length,
                  itemBuilder: (context, index) {
                    final item = cartProvier.items[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 75,
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            height: 55,
                            width: 55,
                            imageUrl: item.image,
                            errorWidget: (context, _, __) => Image.asset(
                              ImageSources.coffeeDefault,
                              height: 55,
                              width: 55,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('${item.price} Р',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
              const MakeOrderButton(),
            ],
          ),
        ));
  }
}
