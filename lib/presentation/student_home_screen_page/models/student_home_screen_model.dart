import '../../../core/app_export.dart';
import 'frameeightyfour_item_model.dart';
import 'description_item_model.dart';

class StudentHomeScreenModel {
  List<FrameeightyfourItemModel> frameeightyfourItemList = [
    FrameeightyfourItemModel(
        fiveThousand: "50:00",
        mohamedHesham: ImageConstant.imgMdiFavouriteBorderRedA700,
        mohamedHesham1: "Mohamed Hesham",
        uIUXDesign: "UI/UX Design",
        complete: "Complete 100%")
  ];

  List<DescriptionItemModel> descriptionItemList =
      List.generate(1, (index) => DescriptionItemModel());
}
