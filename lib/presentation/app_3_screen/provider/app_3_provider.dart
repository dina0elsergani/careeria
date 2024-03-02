import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/app_3_model.dart';

/// A provider class for the App3Screen.
///
/// This provider manages the state of the App3Screen, including the
/// current app3ModelObj

// ignore_for_file: must_be_immutable
class App3Provider extends ChangeNotifier {
  App3Model app3ModelObj = App3Model();

  @override
  void dispose() {
    super.dispose();
  }
}
