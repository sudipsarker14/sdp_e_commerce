import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:flutter_e_commerce/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SdpSignUpForm extends StatelessWidget {
  const SdpSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpSignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            // First & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        SdpValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: SdpTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: SdpSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        SdpValidator.validateEmptyText('Last name', value),
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
              controller: controller.userName,
              validator: (value) =>
                  SdpValidator.validateEmptyText('User name', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: SdpTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: SdpSizes.spaceBtwInputFields),
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => SdpValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: SdpTexts.email,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: SdpSizes.spaceBtwInputFields),
            //Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => SdpValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: SdpTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: SdpSizes.spaceBtwInputFields),

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
            const SizedBox(height: SdpSizes.spaceBtwInputFields),
            //Terms & conditions Checkbox

            const SdpTermsAndCondititionCheckbox(),

            const SizedBox(height: SdpSizes.spaceBtwSections),
            // Sign Up Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(SdpTexts.createAccount))),
          ],
        ));
  }
}
