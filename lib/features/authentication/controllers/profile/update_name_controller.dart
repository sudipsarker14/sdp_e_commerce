import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/data/repositories/user/user_repository.dart';
import 'package:flutter_e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpUpdateNameController extends GetxController {
  static SdpUpdateNameController get instance => Get.find();

  // Variables
  final lastName = TextEditingController(); // Comtroller for last name input
  final firstName = TextEditingController(); // Comtroller for first name input
  final userController = SdpUserController.instance;
  final userRepository = Get.put(SdpUserRepository());
  GlobalKey<FormState> updateUserNameFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  // init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "We are update your information...", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show Success Message
      SdpLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen.
      Get.off(() => const SdpProfileScreen());
    } catch (e) {
      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
