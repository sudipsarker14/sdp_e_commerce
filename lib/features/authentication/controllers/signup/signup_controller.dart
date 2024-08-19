import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/data/repositories/user/user_repository.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_e_commerce/features/personalization/models/user_model.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpSignupController extends GetxController {
  static SdpSignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Obervable for privacy policy acceptance
  final email = TextEditingController(); // Comtroller for email input
  final lastName = TextEditingController(); // Comtroller for last name input
  final userName = TextEditingController(); // Comtroller for user name input
  final password = TextEditingController(); // Comtroller for password input
  final firstName = TextEditingController(); // Comtroller for first name input
  final phoneNumber =
      TextEditingController(); // Comtroller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  // -- Signup

  void signup() async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "We are processing your information...", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
         // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        SdpLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the firebase
      final userCredential = await SdpAuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authentication user data in the firebase firestore
      final newUser = SdpUserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(SdpUserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show Success Message
      SdpLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      // Move to verify Email Screen
      Get.to(() => SdpVerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
