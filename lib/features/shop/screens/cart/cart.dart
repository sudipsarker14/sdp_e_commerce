import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpCartScreen extends StatelessWidget {
  const SdpCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SdpAppbar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(SdpSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, __) =>
              const SizedBox(height: SdpSizes.spaceBtwSections),
          itemBuilder: (_, index) => const Column(
            children: [
              SdpCartItem(),
              SizedBox(height: SdpSizes.spaceBtwItems),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SdpSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$256')),
      ),
    );
  }
}
