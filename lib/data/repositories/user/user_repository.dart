import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/features/personalization/models/user_model.dart';
import 'package:flutter_e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Repository Class for user-related operation.

class SdpUserRepository extends GetxController {
  static SdpUserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore

   Future<void> saveUserRecord(
      SdpUserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } /*on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } */on FirebaseException catch (e) {
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
