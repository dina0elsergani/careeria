import 'package:shared_preferences/shared_preferences.dart';
import 'frameeightyfour_item_model.dart';
import 'description_item_model.dart';

class StudentHomeScreenModel {
  List<FrameeightyfourItemModel> frameeightyfourItemList = [];
  List<DescriptionItemModel> descriptionItemList =
      List.generate(1, (index) => DescriptionItemModel());

  StudentHomeScreenModel() {
    loadLatestFavorite();
  }

  Future<void> loadLatestFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    print('favourites ${favorites}');
    if (favorites.isNotEmpty) {
      String latestFavorite = favorites.last;
      List<String> parts = latestFavorite.split(',');
      if (parts.length >= 3) {
        String title = parts[0];
        String thumbnail = parts[2];
        frameeightyfourItemList = [
          FrameeightyfourItemModel(videoImage: thumbnail, videoName: title),
        ];
      }
    }
  }
}
