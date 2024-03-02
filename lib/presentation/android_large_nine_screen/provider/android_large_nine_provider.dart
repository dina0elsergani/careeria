import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/android_large_nine_model.dart';

/// A provider class for the AndroidLargeNineScreen.
///
/// This provider manages the state of the AndroidLargeNineScreen, including the
/// current androidLargeNineModelObj
class AndroidLargeNineProvider extends ChangeNotifier {
  AndroidLargeNineModel androidLargeNineModelObj = AndroidLargeNineModel();

  @override
  void dispose() {
    super.dispose();
  }
}
