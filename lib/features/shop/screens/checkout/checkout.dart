import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/login_signup/success_screen.dart';
import 'package:flutter_e_commerce/common/widgets/products/cart/coupon_code.dart';
import 'package:flutter_e_commerce/features/shop/screens/cart/widget/cart_items_widgeys.dart';
import 'package:flutter_e_commerce/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:flutter_e_commerce/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:flutter_e_commerce/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:flutter_e_commerce/navigation_menu/nevigation_menu.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SdpCheckOutScreen extends StatelessWidget {
  const SdpCheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SdpAppbar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const SdpCartItems(showAddRemoveButtons: false),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              /// Coupon TextField
              const SdpCouponCode(),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              /// Billing Section
              SdpRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(SdpSizes.md),
                backgroundColor: dark ? SdpColors.black : SdpColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    SdpBillingAmountSection(),
                    SizedBox(height: SdpSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: SdpSizes.spaceBtwItems),

                    /// Payment Methods
                    SdpBillingPaymentSection(),
                    SizedBox(height: SdpSizes.spaceBtwItems),

                    /// Address
                    SdpBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SdpSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SdpSuccessScreenOne(
                image: SdpImages.successfulPaymentIcon,
                tittle: 'Your Payment has Success!',
                subTitle: 'Your item will be delivered soon!',
                onPressed: () => Get.offAll(() => const SdpNavigationMenu()))),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
