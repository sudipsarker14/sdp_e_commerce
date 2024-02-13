//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

/// Helper functions for cloud-related operations.
class TCloudHelperFunctions {
  /// Helper function to check the state of a single database record.
  ///
  /// Returns a Widget based on the state of the snapshot.
  /// If data is still loading, it returns a CircularProgressIndicator.
  /// If no data is found, it returns a generic "No Data Found" message.
  /// If an error occurs, it returns a generic error message.
  /// Otherwise, it returns null.
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found!'));
    }
  }
}
