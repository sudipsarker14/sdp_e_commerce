import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:flutter_e_commerce/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SdpReAuthLoginForm extends StatelessWidget {
  const SdpReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SdpUserController.instance;
    return Scaffold(
      appBar: const SdpAppbar(showBackArrow: true, title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: SdpTexts.email),
                ),
                const SizedBox(height: SdpSizes.spaceBtwInputFields),
                
                // Password
                Obx(
              () => TextFormField(
                controller: controller.verifyPassword,
                validator: (value) => SdpValidator.validateEmptyText('Password', value),
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
             const SizedBox(height: SdpSizes.spaceBtwSections),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
              )
              ],
            )
            ),
          ),
      ),
    );
  }
}
