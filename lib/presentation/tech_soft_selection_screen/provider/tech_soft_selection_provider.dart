import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/tech_soft_selection_model.dart';

/// A provider class for the TechSoftSelectionScreen.
///
/// This provider manages the state of the TechSoftSelectionScreen, including the
/// current techSoftSelectionModelObj

// ignore_for_file: must_be_immutable
class TechSoftSelectionProvider extends ChangeNotifier {
  TechSoftSelectionModel techSoftSelectionModelObj = TechSoftSelectionModel();

  @override
  void dispose() {
    super.dispose();
  }
}
