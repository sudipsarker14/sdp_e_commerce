import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:flutter_e_commerce/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SdpForgetPassword extends StatelessWidget {
  const SdpForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(SdpTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text(SdpTexts.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: SdpSizes.spaceBtwSections * 2),

              //Text field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: SdpValidator.validateEmail,
                  decoration: const InputDecoration(
                      labelText: SdpTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              //Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(SdpTexts.submit)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
