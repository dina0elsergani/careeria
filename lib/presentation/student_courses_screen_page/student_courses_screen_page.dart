import 'package:careeria/presentation/course_videos_screen/course_videos_screen.dart';
import 'package:careeria/presentation/student_courses_screen_page/provider/student_courses_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/core/app_export.dart';

class StudentCoursesScreenPage extends StatefulWidget {
  const StudentCoursesScreenPage({Key? key}) : super(key: key);

  @override
  StudentCoursesScreenPageState createState() =>
      StudentCoursesScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StudentCoursesScreenProvider(),
        child: StudentCoursesScreenPage());
  }
}

class StudentCoursesScreenPageState extends State<StudentCoursesScreenPage> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    // Fetch course playlist data on initialization
    Provider.of<StudentCoursesScreenProvider>(context, listen: false)
        .fetchCoursePlaylist(context);
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              Divider(color: theme.colorScheme.onPrimaryContainer),
              SizedBox(height: 20),
              _buildPlaylist(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_resources".tr));
  }

  Widget _buildPlaylist(BuildContext context) {
    return Consumer<StudentCoursesScreenProvider>(
      builder: (context, provider, child) {
        if (provider.courseItems.isEmpty) {
          return Center(child: Center(child: CircularProgressIndicator()));
        } else {
          return Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 23),
              itemCount: provider.courseItems.length,
              itemBuilder: (context, index) {
                CourseItem item = provider.courseItems[index];
                return ListTile(
                  title: Text(
                    item.title,
                    style: theme.textTheme.titleSmall,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseVideosScreen(videoUrl: item.url),
                      ),
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      item.thumbnail,
                      width: 95.0, // Adjust as needed
                      height: 95.0, // Adjust as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: item.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        item.isFavorite = !item.isFavorite; // Toggle favorite state
                      });
                      _updateFavorites(item); // Update favorites in SharedPreferences
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
  void _updateFavorites(CourseItem item) {
    List<String> favorites = _prefs.getStringList('favorites') ?? [];
    String itemJson = '${item.title},${item.url},${item.thumbnail}';
    if (item.isFavorite) {
      // Add to favorites
      favorites.add(itemJson);
    } else {
      // Remove from favorites
      favorites.remove(itemJson);
    }
    _prefs.setStringList('favorites', favorites);
  }
}

