import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/app_introduction1_model.dart';

/// A provider class for the AppIntroduction1Screen.
///
/// This provider manages the state of the AppIntroduction1Screen, including the
/// current appIntroduction1ModelObj

// ignore_for_file: must_be_immutable
class AppIntroduction1Provider extends ChangeNotifier {
  AppIntroduction1Model appIntroduction1ModelObj = AppIntroduction1Model();

  @override
  void dispose() {
    super.dispose();
  }
}
