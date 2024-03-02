import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/course_view_model.dart';
import '../models/androidlargetwentyfour_item_model.dart';

/// A provider class for the CourseViewScreen.
///
/// This provider manages the state of the CourseViewScreen, including the
/// current courseViewModelObj

// ignore_for_file: must_be_immutable
class CourseViewProvider extends ChangeNotifier {
  CourseViewModel courseViewModelObj = CourseViewModel();

  @override
  void dispose() {
    super.dispose();
  }
}
