import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/student_courses_screen_model.dart';
import '../models/androidlargeseventeen_item_model.dart';

/// A provider class for the StudentCoursesScreenPage.
///
/// This provider manages the state of the StudentCoursesScreenPage, including the
/// current studentCoursesScreenModelObj

// ignore_for_file: must_be_immutable
class StudentCoursesScreenProvider extends ChangeNotifier {
  TextEditingController coursesController = TextEditingController();

  StudentCoursesScreenModel studentCoursesScreenModelObj =
      StudentCoursesScreenModel();

  @override
  void dispose() {
    super.dispose();
    coursesController.dispose();
  }
}
