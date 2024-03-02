import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/frame_eightyone_model.dart';

/// A provider class for the FrameEightyoneScreen.
///
/// This provider manages the state of the FrameEightyoneScreen, including the
/// current frameEightyoneModelObj
class FrameEightyoneProvider extends ChangeNotifier {
  FrameEightyoneModel frameEightyoneModelObj = FrameEightyoneModel();

  @override
  void dispose() {
    super.dispose();
  }
}
