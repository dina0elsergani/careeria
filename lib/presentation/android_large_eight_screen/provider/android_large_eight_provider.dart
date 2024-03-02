import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/android_large_eight_model.dart';

/// A provider class for the AndroidLargeEightScreen.
///
/// This provider manages the state of the AndroidLargeEightScreen, including the
/// current androidLargeEightModelObj
class AndroidLargeEightProvider extends ChangeNotifier {
  AndroidLargeEightModel androidLargeEightModelObj = AndroidLargeEightModel();

  @override
  void dispose() {
    super.dispose();
  }
}
