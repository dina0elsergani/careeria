import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/course_test_failure_model.dart';

/// A provider class for the CourseTestFailureScreen.
///
/// This provider manages the state of the CourseTestFailureScreen, including the
/// current courseTestFailureModelObj

// ignore_for_file: must_be_immutable
class CourseTestFailureProvider extends ChangeNotifier {
  CourseTestFailureModel courseTestFailureModelObj = CourseTestFailureModel();

  @override
  void dispose() {
    super.dispose();
  }
}
