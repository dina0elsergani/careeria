import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/android_large_twentythree_container_model.dart';

/// A provider class for the AndroidLargeTwentythreeContainerScreen.
///
/// This provider manages the state of the AndroidLargeTwentythreeContainerScreen, including the
/// current androidLargeTwentythreeContainerModelObj

// ignore_for_file: must_be_immutable
class AndroidLargeTwentythreeContainerProvider extends ChangeNotifier {
  AndroidLargeTwentythreeContainerModel
      androidLargeTwentythreeContainerModelObj =
      AndroidLargeTwentythreeContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
