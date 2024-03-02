import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/student_profile_model.dart';

/// A provider class for the StudentProfileScreen.
///
/// This provider manages the state of the StudentProfileScreen, including the
/// current studentProfileModelObj

// ignore_for_file: must_be_immutable
class StudentProfileProvider extends ChangeNotifier {
  StudentProfileModel studentProfileModelObj = StudentProfileModel();

  @override
  void dispose() {
    super.dispose();
  }

  onSelected(dynamic value) {
    for (var element in studentProfileModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
