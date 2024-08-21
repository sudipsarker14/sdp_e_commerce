import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SdpVerifyEmailScreen extends StatelessWidget {
  const SdpVerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpVerifyEmailController());
    return Scaffold(
      // The close icon in the app abr is used to logout the user and redirect them to the login screen.
      // This approach is taken to handle scenarios where the user enters the registration process
      // and the data is stored. Upon reopening the app, it checks if the email is verified.
      // If not verified, the app always navigates to the verification screen.
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => SdpAuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: const AssetImage(SdpImages.deliveredEmailIllustration),
                width: SdpHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              //Title & SubTitle
              Text(SdpTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text(SdpTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(SdpTexts.tContinue)),
              ),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(), child: const Text(SdpTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
