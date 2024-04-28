import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/features/shop/screens/cart/widget/cart_items_widgeys.dart';
import 'package:flutter_e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SdpCartScreen extends StatelessWidget {
  const SdpCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SdpAppbar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(SdpSizes.defaultSpace),

        /// Items in cart
        child: SdpCartItems(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SdpSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const SdpCheckOutScreen()),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
