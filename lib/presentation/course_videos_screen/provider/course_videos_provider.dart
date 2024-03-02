import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/course_videos_model.dart';
import '../models/androidlargetwenty_item_model.dart';

/// A provider class for the CourseVideosScreen.
///
/// This provider manages the state of the CourseVideosScreen, including the
/// current courseVideosModelObj

// ignore_for_file: must_be_immutable
class CourseVideosProvider extends ChangeNotifier {
  CourseVideosModel courseVideosModelObj = CourseVideosModel();

  @override
  void dispose() {
    super.dispose();
  }
}
