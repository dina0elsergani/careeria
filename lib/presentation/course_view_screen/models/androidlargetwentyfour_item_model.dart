import '../../../core/app_export.dart';

/// This class is used in the [androidlargetwentyfour_item_widget] screen.
class AndroidlargetwentyfourItemModel {
  AndroidlargetwentyfourItemModel({
    this.image,
    this.introductionTo,
    this.time,
    this.image1,
    this.completed,
    this.id,
  }) {
    image = image ?? ImageConstant.imgContrast;
    introductionTo = introductionTo ?? "Introduction To User Experience Design";
    time = time ?? "Video: 5 mins";
    image1 = image1 ?? ImageConstant.imgDone;
    completed = completed ?? "Completed";
    id = id ?? "";
  }

  String? image;

  String? introductionTo;

  String? time;

  String? image1;

  String? completed;

  String? id;
}
