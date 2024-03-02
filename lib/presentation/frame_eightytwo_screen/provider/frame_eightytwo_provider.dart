import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/frame_eightytwo_model.dart';

/// A provider class for the FrameEightytwoScreen.
///
/// This provider manages the state of the FrameEightytwoScreen, including the
/// current frameEightytwoModelObj
class FrameEightytwoProvider extends ChangeNotifier {
  FrameEightytwoModel frameEightytwoModelObj = FrameEightytwoModel();

  @override
  void dispose() {
    super.dispose();
  }
}
