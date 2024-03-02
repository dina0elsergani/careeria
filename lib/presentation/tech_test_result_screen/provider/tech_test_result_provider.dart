import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/tech_test_result_model.dart';

/// A provider class for the TechTestResultScreen.
///
/// This provider manages the state of the TechTestResultScreen, including the
/// current techTestResultModelObj
class TechTestResultProvider extends ChangeNotifier {
  TechTestResultModel techTestResultModelObj = TechTestResultModel();

  @override
  void dispose() {
    super.dispose();
  }
}
