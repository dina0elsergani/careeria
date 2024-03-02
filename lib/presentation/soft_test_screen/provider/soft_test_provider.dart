import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/soft_test_model.dart';

/// A provider class for the SoftTestScreen.
///
/// This provider manages the state of the SoftTestScreen, including the
/// current softTestModelObj

// ignore_for_file: must_be_immutable
class SoftTestProvider extends ChangeNotifier {
  SoftTestModel softTestModelObj = SoftTestModel();

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
