import 'dart:convert';
import 'package:careeria/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudentCoursesScreenProvider extends ChangeNotifier {
  TextEditingController coursesController = TextEditingController();
  List<CourseItem> courseItems = [];
  String playlistName = ''; // Initialize playlistName
  late SharedPreferences _prefs;

  Future<void> fetchCoursePlaylist(BuildContext context) async {
    await _initSharedPreferences(); // Ensure SharedPreferences is initialized

    try {
      bool isTechSelected = _prefs.getBool('isTechSelected') ?? false;
      print('tech ${_prefs.getBool('isTechSelected')}');
      String apiurl = isTechSelected ? '$apiUrl/api/v1/course/by-role-name?role_name=${userTrack}': 'http://192.168.1.7:8000/api/v1/softcourse' ;

      final response = await http.get(
        Uri.parse(apiurl),
        // Add headers or other configurations if needed
      );

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);

        if (jsonBody.containsKey('playlistName')) {
          playlistName = jsonBody['playlistName']; // Extract playlistName
        } else {
          debugPrint('API response does not contain expected playlistName');
        }

        List<String> favorites = _prefs.getStringList('favorites') ?? [];

        if (jsonBody.containsKey('playlistItems')) {
          courseItems = List<CourseItem>.from(jsonBody['playlistItems']
              .map((item) => CourseItem.fromJson(item, favorites)));
          notifyListeners();
        } else {
          // Handle API response format error
          debugPrint('API response does not contain expected playlistItems');
        }
      } else {
        // Handle HTTP error
        debugPrint('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or parsing errors
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    coursesController.dispose();
  }
}

class CourseItem {
  final String title;
  final String url;
  final String thumbnail;
  bool isFavorite;

  CourseItem({
    required this.title,
    required this.url,
    required this.thumbnail,
    this.isFavorite = false,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json, List<String> favorites) {
    final String itemJson = '${json['title']},${json['url']},${json['thumbnail']}';
    return CourseItem(
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      isFavorite: favorites.contains(itemJson),
    );
  }
}
