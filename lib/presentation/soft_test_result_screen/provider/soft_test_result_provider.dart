import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/soft_test_result_model.dart';

/// A provider class for the SoftTestResultScreen.
///
/// This provider manages the state of the SoftTestResultScreen, including the
/// current softTestResultModelObj

// ignore_for_file: must_be_immutable
class SoftTestResultProvider extends ChangeNotifier {
  SoftTestResultModel softTestResultModelObj = SoftTestResultModel();

  @override
  void dispose() {
    super.dispose();
  }
}
