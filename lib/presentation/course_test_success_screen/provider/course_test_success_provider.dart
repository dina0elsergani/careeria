import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/course_test_success_model.dart';

/// A provider class for the CourseTestSuccessScreen.
///
/// This provider manages the state of the CourseTestSuccessScreen, including the
/// current courseTestSuccessModelObj

// ignore_for_file: must_be_immutable
class CourseTestSuccessProvider extends ChangeNotifier {
  CourseTestSuccessModel courseTestSuccessModelObj = CourseTestSuccessModel();

  @override
  void dispose() {
    super.dispose();
  }
}
