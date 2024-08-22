import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_commerce/data/repositories/user/user_repository.dart';
import 'package:flutter_e_commerce/features/personalization/models/user_model.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpUserController extends GetxController {
  static SdpUserController get instance => Get.find();

  final userRepository = Get.put(SdpUserRepository());

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
}
