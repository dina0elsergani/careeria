import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/settings_screen_model.dart';

/// A provider class for the SettingsScreenPage.
///
/// This provider manages the state of the SettingsScreenPage, including the
/// current settingsScreenModelObj

// ignore_for_file: must_be_immutable
class SettingsScreenProvider extends ChangeNotifier {
  SettingsScreenModel settingsScreenModelObj = SettingsScreenModel();

  bool isSelectedSwitch = false;

  bool isSelectedSwitch1 = false;

  @override
  void dispose() {
    super.dispose();
  }

  void changeSwitchBox1(bool value) {
    isSelectedSwitch = value;
    notifyListeners();
  }

  void changeSwitchBox2(bool value) {
    isSelectedSwitch1 = value;
    notifyListeners();
  }
}
