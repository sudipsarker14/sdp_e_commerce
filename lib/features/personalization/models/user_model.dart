import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce/utils/formatters/formatter.dart';

class SdpUserModel {
  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Constructor for UserModel

  SdpUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number
  String get formattedPhoneNo => SdpFormatter.formatPhoneNumber(phoneNumber);

  // Static funtion to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static funtion to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername =
        "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  // Static function to create an empty user
  static SdpUserModel empty() => SdpUserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  // Convert model to model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create a Usermodel from a Firebase document snapshot

  factory SdpUserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return SdpUserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return SdpUserModel.empty();
    }
  }
}
