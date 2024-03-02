import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/avatar_model.dart';
import '../models/androidlargesix_item_model.dart';

/// A provider class for the AvatarScreen.
///
/// This provider manages the state of the AvatarScreen, including the
/// current avatarModelObj

// ignore_for_file: must_be_immutable
class AvatarProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();

  AvatarModel avatarModelObj = AvatarModel();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
}
