import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/tech_third_test_result_model.dart';

/// A provider class for the TechThirdTestResultScreen.
///
/// This provider manages the state of the TechThirdTestResultScreen, including the
/// current techThirdTestResultModelObj
class TechThirdTestResultProvider extends ChangeNotifier {
  TechThirdTestResultModel techThirdTestResultModelObj =
      TechThirdTestResultModel();

  @override
  void dispose() {
    super.dispose();
  }
}
