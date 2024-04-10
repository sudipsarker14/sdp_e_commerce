import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:flutter_e_commerce/common/widgets/list_tile/user_profile_tile.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SdpSettingsScreen extends StatelessWidget {
  const SdpSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            SdpPrimaryHeaderContainer(
                child: Column(
              children: [
                /// AppBar
                SdpAppbar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: SdpColors.white)),
                ),

                //User Profile Card
                SdpUserProfileTile(
                    onPressed: () => Get.to(() => const SdpProfileScreen())),
                const SizedBox(height: SdpSizes.spaceBtwSections)
              ],
            )),

            // Body
            Padding(
              padding: const EdgeInsets.all(SdpSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const SdpSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: SdpSizes.spaceBtwItems),

                  SdpSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      onTap: () {}),

                  // App Settings
                  const SizedBox(height: SdpSizes.spaceBtwSections),

                  const SdpSectionHeading(
                      title: 'App Setings', showActionButton: false),
                  const SizedBox(height: SdpSizes.spaceBtwItems),
                  SdpSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase',
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {}),
                      onTap: () {}),
                  SdpSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {}),
                      onTap: () {}),

                  // Logout Button
                  const SizedBox(height: SdpSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child:
                        OutlinedButton(onPressed: () {}, child: Text('Logout')),
                  ),
                  const SizedBox(height: SdpSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
