import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_commerce/common/widgets/login_signup/success_screen.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpVerifyEmailController extends GetxController {
  static SdpVerifyEmailController get instance => Get.find();

  // Send Email whenever Verify appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification link
  sendEmailVerification() async {
    try {
      await SdpAuthenticationRepository.instance.sendEmailVerification();
      SdpLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SdpSuccessScreenOne(
              image: SdpImages.successfullyRegisterAnimation,
              tittle: SdpTexts.yourAccountCreatedTitle,
              subTitle: SdpTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  SdpAuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  // Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SdpSuccessScreenOne(
            image: SdpImages.successfullyRegisterAnimation,
            tittle: SdpTexts.yourAccountCreatedTitle,
            subTitle: SdpTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                SdpAuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
