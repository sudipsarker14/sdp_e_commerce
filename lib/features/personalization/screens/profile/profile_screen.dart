import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SdpProfileScreen extends StatelessWidget {
  const SdpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const SdpCircularImage(
                      image: SdpImages.user, width: 80, height: 80),
                  TextButton(
                      onPressed: () {},
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
                onPressed: () {}, tittle: 'Name', value: 'Sudip Sarker'),
            SdpProfileMenu(
                onPressed: () {}, tittle: 'Username', value: 'sudip1411'),

            const SizedBox(height: SdpSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            /// Heading Personal Info
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'User Id',
                icon: Iconsax.copy,
                value: '4787454545'),
            SdpProfileMenu(
                onPressed: () {}, tittle: 'E-mail', value: 'email@email.com'),
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'Phone Number',
                value: '+546566468745'),
            SdpProfileMenu(onPressed: () {}, tittle: 'Sex', value: 'Male'),
            SdpProfileMenu(
                onPressed: () {},
                tittle: 'Date of Birth',
                value: '14 Nov 2001'),

            const SizedBox(height: SdpSizes.spaceBtwItems),
            const Divider(),

            Center(
              child: TextButton(
                onPressed: () {},
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
