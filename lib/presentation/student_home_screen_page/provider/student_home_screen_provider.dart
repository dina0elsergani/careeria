import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/student_home_screen_model.dart';
import '../models/frameeightyfour_item_model.dart';
import '../models/description_item_model.dart';

/// A provider class for the StudentHomeScreenPage.
///
/// This provider manages the state of the StudentHomeScreenPage, including the
/// current studentHomeScreenModelObj

// ignore_for_file: must_be_immutable
class StudentHomeScreenProvider extends ChangeNotifier {
  StudentHomeScreenModel studentHomeScreenModelObj = StudentHomeScreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
