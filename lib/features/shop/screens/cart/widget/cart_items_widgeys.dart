import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpCartItems extends StatelessWidget {
  const SdpCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: SdpSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Items
          const SdpCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: SdpSizes.spaceBtwItems),

          /// Add Remove Button Row with total price
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add Remove Buttons
                    SdpProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// Product total Price
                SdpProductPriceText(price: '256')
              ],
            )
        ],
      ),
    );
  }
}
