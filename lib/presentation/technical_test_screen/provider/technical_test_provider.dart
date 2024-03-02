import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/technical_test_model.dart';

/// A provider class for the TechnicalTestScreen.
///
/// This provider manages the state of the TechnicalTestScreen, including the
/// current technicalTestModelObj

// ignore_for_file: must_be_immutable
class TechnicalTestProvider extends ChangeNotifier {
  TechnicalTestModel technicalTestModelObj = TechnicalTestModel();

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
