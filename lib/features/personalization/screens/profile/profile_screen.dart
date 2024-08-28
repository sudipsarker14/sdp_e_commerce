import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/common/widgets/shimmers/shimmer.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SdpProfileScreen extends StatelessWidget {
  const SdpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SdpUserController.instance;
    return Scaffold(
      appBar: const SdpAppbar(showBackArrow: true, title: Text('Profile')),

      // Body
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(SdpSizes.defaultSpace),
        child: Column(
          children: [
            // Prfile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : SdpImages.user;
                    return controller.imageUploading.value 
                    ? const SdpShimmerEffect(width: 80, height: 80, redius: 80)
                    : SdpCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty);
                  }),
                  TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture')),
                ],
              ),
            ),

            /// Details
            const SizedBox(height: SdpSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            /// Heading Profile Info
            const SdpSectionHeading(
                title: 'Profile Information', showActionButton: false),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            SdpProfileMenu(
                onPressed: () => Get.to(() => const SdpChangeName()),
                tittle: 'Name',
                value: controller.user.value.fullName),
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'Username',
                value: controller.user.value.username),

            const SizedBox(height: SdpSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            /// Heading Personal Info
            ///  /// Heading Profile Info
            const SdpSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            SdpProfileMenu(
                onPressed: () {},
                tittle: 'User Id',
                icon: Iconsax.copy,
                value: controller.user.value.id),
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'E-mail',
                value: controller.user.value.email),
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'Phone Number',
                value: controller.user.value.phoneNumber),
            SdpProfileMenu(onPressed: () {}, tittle: 'Sex', value: 'Male'),
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'Date of Birth',
                value: '14 Nov 2001'),

            const SizedBox(height: SdpSizes.spaceBtwItems),
            const Divider(),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
