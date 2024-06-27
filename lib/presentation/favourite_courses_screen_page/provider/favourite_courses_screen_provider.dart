import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/favourite_courses_screen_model.dart';

class CourseItem {
  final String title;
  final String url;
  final String thumbnail;
  bool isFavorite; // Add isFavorite property

  CourseItem({
    required this.title,
    required this.url,
    required this.thumbnail,
    this.isFavorite = false, // Initialize isFavorite to false
  });
}

class FavouriteCoursesScreenProvider extends ChangeNotifier {
  List<CourseItem> favoriteItems = [];
  SharedPreferences? _prefs;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    loadFavoritesFromPrefs();
  }

  void loadFavoritesFromPrefs() {
    final List<String>? favorites = _prefs?.getStringList('favorites');
    if (favorites != null) {
      favoriteItems = favorites.map((fav) {
        List<String> parts = fav.split(',');
        return CourseItem(
          title: parts[0],
          url: parts[1],
          thumbnail: parts[2],
          isFavorite: true, // Mark as favorite since it's from SharedPreferences
        );
      }).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
