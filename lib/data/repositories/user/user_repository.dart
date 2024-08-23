import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/features/personalization/models/user_model.dart';
import 'package:flutter_e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

// Repository Class for user-related operation.

class SdpUserRepository extends GetxController {
  static SdpUserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore

  Future<void> saveUserRecord(SdpUserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } /*on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } */
    on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function too fatch user details based on user ID
  Future<SdpUserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(SdpAuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return SdpUserModel.fromSnapshot(documentSnapshot);
      } else {
        return SdpUserModel.empty();
      }
    } /*on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } */
    on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function to update user data Firestore.
  Future<void> updateUserDetails(SdpUserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } /*on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } */
    on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Update any field in specific User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(SdpAuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } /*on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } */
    on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } /*on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } */
    on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
