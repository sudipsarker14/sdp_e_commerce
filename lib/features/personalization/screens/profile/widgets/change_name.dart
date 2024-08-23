import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/profile/update_name_controller.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:flutter_e_commerce/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SdpChangeName extends StatelessWidget {
  const SdpChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpUpdateNameController());
    return Scaffold(
      // Custome Appbar
      appBar: SdpAppbar(
        showBackArrow: true,
        title: Text("Change Name",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                'Use real name for easy verification. This name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              // Text field and Button
              Form(
                  key: controller.updateUserNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) =>
                            SdpValidator.validateEmptyText("First name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: SdpTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: SdpSizes.spaceBtwInputFields),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) =>
                            SdpValidator.validateEmptyText("Last name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: SdpTexts.lastName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                    ],
                  )),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
