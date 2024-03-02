import '../../../core/app_export.dart';

/// This class is used in the [androidlargeseventeen_item_widget] screen.
class AndroidlargeseventeenItemModel {
  AndroidlargeseventeenItemModel({
    this.uiUxdesign,
    this.uiUxDesign1,
    this.mohamedHesham,
    this.complete,
    this.complete1,
    this.id,
  }) {
    uiUxdesign = uiUxdesign ?? ImageConstant.imgRectangle29;
    uiUxDesign1 = uiUxDesign1 ?? "Ui/Ux design";
    mohamedHesham = mohamedHesham ?? "Mohamed Hesham";
    complete = complete ?? ImageConstant.imgGroup18;
    complete1 = complete1 ?? "Complete 100%";
    id = id ?? "";
  }

  String? uiUxdesign;

  String? uiUxDesign1;

  String? mohamedHesham;

  String? complete;

  String? complete1;

  String? id;
}
