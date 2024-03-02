import '../../../core/app_export.dart';

/// This class is used in the [frameeightyfour_item_widget] screen.
class FrameeightyfourItemModel {
  FrameeightyfourItemModel({
    this.fiveThousand,
    this.mohamedHesham,
    this.mohamedHesham1,
    this.uIUXDesign,
    this.complete,
    this.id,
  }) {
    fiveThousand = fiveThousand ?? "50:00";
    mohamedHesham = mohamedHesham ?? ImageConstant.imgMdiFavouriteBorderRedA700;
    mohamedHesham1 = mohamedHesham1 ?? "Mohamed Hesham";
    uIUXDesign = uIUXDesign ?? "UI/UX Design";
    complete = complete ?? "Complete 100%";
    id = id ?? "";
  }

  String? fiveThousand;

  String? mohamedHesham;

  String? mohamedHesham1;

  String? uIUXDesign;

  String? complete;

  String? id;
}
