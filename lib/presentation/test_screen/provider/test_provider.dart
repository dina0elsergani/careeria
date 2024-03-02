import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/test_model.dart';

/// A provider class for the TestScreen.
///
/// This provider manages the state of the TestScreen, including the
/// current testModelObj

// ignore_for_file: must_be_immutable
class TestProvider extends ChangeNotifier {
  TestModel testModelObj = TestModel();

  String radioGroup = "";

  @override
  void dispose() {
    super.dispose();
  }

  void changeRadioButton1(String value) {
    radioGroup = value;
    notifyListeners();
  }
}
