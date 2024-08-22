import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_e_commerce/features/authentication/screens/password_configuration/forget_passwprd.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:flutter_e_commerce/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SdpLoginForm extends StatelessWidget {
  const SdpLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpLogingController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SdpSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) =>SdpValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: SdpTexts.email),
            ),
            const SizedBox(height: SdpSizes.spaceBtwItems),
           
            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => SdpValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: SdpTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) {})),
                    const Text(SdpTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const SdpForgetPassword()),
                    child: const Text(SdpTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: SdpSizes.spaceBtwSections * 0.5),

            //Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(SdpTexts.signIn))),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(SdpTexts.createAccount))),
            // const SizedBox(height: SdpSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
