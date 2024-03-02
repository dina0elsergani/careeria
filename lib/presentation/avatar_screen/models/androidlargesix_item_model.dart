import '../../../core/app_export.dart';

/// This class is used in the [androidlargesix_item_widget] screen.
class AndroidlargesixItemModel {
  AndroidlargesixItemModel({
    this.ellipse,
    this.id,
  }) {
    ellipse = ellipse ?? ImageConstant.imgEllipse9;
    id = id ?? "";
  }

  String? ellipse;

  String? id;
}
