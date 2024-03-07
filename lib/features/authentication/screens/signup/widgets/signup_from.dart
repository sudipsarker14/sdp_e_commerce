import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SdpSignUpForm extends StatelessWidget {
  const SdpSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        // First & Last Name
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: SdpTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: SdpSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: SdpTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(height: SdpSizes.spaceBtwInputFields),

        // Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SdpTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: SdpSizes.spaceBtwInputFields),
        //Email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SdpTexts.email, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: SdpSizes.spaceBtwInputFields),
        //Phone Number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SdpTexts.phoneNo, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: SdpSizes.spaceBtwInputFields),

        // Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: SdpTexts.password,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: SdpSizes.spaceBtwInputFields),
        //Terms & conditions Checkbox

        const SdpTermsAndCondititionCheckbox(),

        const SizedBox(height: SdpSizes.spaceBtwSections),
        // Sign Up Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const SdpVerifyEmailScreen()),
                child: const Text(SdpTexts.createAccount))),
      ],
    ));
  }
}
