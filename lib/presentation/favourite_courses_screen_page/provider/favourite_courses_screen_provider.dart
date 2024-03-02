import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/favourite_courses_screen_model.dart';
import '../models/androidlargetwentyfive_item_model.dart';

/// A provider class for the FavouriteCoursesScreenPage.
///
/// This provider manages the state of the FavouriteCoursesScreenPage, including the
/// current favouriteCoursesScreenModelObj

// ignore_for_file: must_be_immutable
class FavouriteCoursesScreenProvider extends ChangeNotifier {
  FavouriteCoursesScreenModel favouriteCoursesScreenModelObj =
      FavouriteCoursesScreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
