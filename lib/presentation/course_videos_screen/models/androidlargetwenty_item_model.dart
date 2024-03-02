import '../../../core/app_export.dart';

/// This class is used in the [androidlargetwenty_item_widget] screen.
class AndroidlargetwentyItemModel {
  AndroidlargetwentyItemModel({
    this.image,
    this.fiveThousand,
    this.uiUxDesign,
    this.brianSusan,
    this.id,
  }) {
    image = image ?? ImageConstant.imgRectangle29;
    fiveThousand = fiveThousand ?? "50:00";
    uiUxDesign = uiUxDesign ?? "Ui/Ux design";
    brianSusan = brianSusan ?? "Brian Susan";
    id = id ?? "";
  }

  String? image;

  String? fiveThousand;

  String? uiUxDesign;

  String? brianSusan;

  String? id;
}
