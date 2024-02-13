import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SdpLoginForm extends StatelessWidget {
  const SdpLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SdpSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: SdpTexts.email),
            ),
            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: SdpTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(SdpTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () {},
                    child: const Text(SdpTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: SdpSizes.spaceBtwSections),

            //Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(SdpTexts.signIn))),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(SdpTexts.createAccount))),
            const SizedBox(height: SdpSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
