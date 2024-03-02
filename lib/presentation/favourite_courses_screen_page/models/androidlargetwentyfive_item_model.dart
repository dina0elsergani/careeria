import '../../../core/app_export.dart';

/// This class is used in the [androidlargetwentyfive_item_widget] screen.
class AndroidlargetwentyfiveItemModel {
  AndroidlargetwentyfiveItemModel({
    this.uiUxdesign,
    this.uiUxDesign1,
    this.mohamedHesham,
    this.uiUxdesign2,
    this.id,
  }) {
    uiUxdesign = uiUxdesign ?? ImageConstant.imgRectangle29;
    uiUxDesign1 = uiUxDesign1 ?? "Ui/Ux design";
    mohamedHesham = mohamedHesham ?? "Mohamed Hesham";
    uiUxdesign2 =
        uiUxdesign2 ?? ImageConstant.imgMdiFavouriteBorderRedA70024x24;
    id = id ?? "";
  }

  String? uiUxdesign;

  String? uiUxDesign1;

  String? mohamedHesham;

  String? uiUxdesign2;

  String? id;
}
