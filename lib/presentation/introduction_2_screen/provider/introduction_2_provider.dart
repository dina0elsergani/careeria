import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/introduction_2_model.dart';

/// A provider class for the Introduction2Screen.
///
/// This provider manages the state of the Introduction2Screen, including the
/// current introduction2ModelObj

// ignore_for_file: must_be_immutable
class Introduction2Provider extends ChangeNotifier {
  Introduction2Model introduction2ModelObj = Introduction2Model();

  @override
  void dispose() {
    super.dispose();
  }
}
