import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/data/repositories/user/user_repository.dart';
import 'package:flutter_e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter_e_commerce/features/personalization/models/user_model.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/widgets/re_authenticate_user_loging_form.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpUserController extends GetxController {
  static SdpUserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<SdpUserModel> user = SdpUserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(SdpUserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(SdpUserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts =
            SdpUserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = SdpUserModel.generateUsername(
            userCredentials.user!.displayName ?? '');

        // Map Data
        final user = SdpUserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      SdpLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SdpSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: SdpSizes.lg),
              child: Text('Delete')),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      SdpFullScreenLoader.openLoadingDialog(
          'Processing', SdpImages.docerAnimation);

      // First re-authenticate user
      final auth = SdpAuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          SdpFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          SdpFullScreenLoader.stopLoading();
          Get.to(() => const SdpReAuthLoginForm());
        }
      }
    } catch (e) {
      SdpFullScreenLoader.stopLoading();
      SdpLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "Processing", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      await SdpAuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await SdpAuthenticationRepository.instance.deleteAccount();
      SdpFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      SdpFullScreenLoader.stopLoading();
      SdpLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
