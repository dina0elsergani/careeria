import 'package:careeria/presentation/favourite_courses_screen_page/provider/favourite_courses_screen_provider.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_export.dart';

class FavouriteCoursesScreenPage extends StatefulWidget {
  const FavouriteCoursesScreenPage({Key? key}) : super(key: key);

  @override
  FavouriteCoursesScreenPageState createState() =>
      FavouriteCoursesScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteCoursesScreenProvider(),
      child: FavouriteCoursesScreenPage(),
    );
  }
}

class FavouriteCoursesScreenPageState
    extends State<FavouriteCoursesScreenPage> {
  late FavouriteCoursesScreenProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<FavouriteCoursesScreenProvider>(context, listen: false);
    _provider.initSharedPreferences();
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
      title: AppbarSubtitle(text: 'Favourite'),
    );
  }

  Widget _buildPlaylist(BuildContext context) {
    return Consumer<FavouriteCoursesScreenProvider>(
      builder: (context, provider, child) {
        if (provider.favoriteItems.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 23),
              itemCount: provider.favoriteItems.length,
              itemBuilder: (context, index) {
                CourseItem item = provider.favoriteItems[index];
                return ListTile(
                  title: Text(
                    item.title,
                    style: theme.textTheme.titleSmall,
                  ),
                  onTap: () {
                    // Handle tapping on the item (e.g., navigate to video screen)
                    // Example: Navigate to a new screen with the video URL
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerPage(url: item.url)));
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
                      // Optionally, you can call a method on your provider to update favorites
                      // provider.addToFavorites(item);
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
}
