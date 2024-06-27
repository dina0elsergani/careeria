import '../../../core/app_export.dart';

/// This class is used in the [frameeightyfour_item_widget] screen.
class FrameeightyfourItemModel {
  FrameeightyfourItemModel({
    this.videoImage,
    this.videoName,
    this.id,
  }) {
    videoImage =  videoImage ?? ImageConstant.imgMdiFavouriteBorderRedA700;
    videoName = videoName ?? "UI/UX Design";
    id = id ?? "";
  }


  String? videoImage;

  String? videoName;

  String? id;
}
