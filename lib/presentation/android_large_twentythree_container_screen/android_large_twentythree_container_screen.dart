import 'package:careeria/presentation/student_home_screen_page/student_home_screen_page.dart';
import 'package:careeria/presentation/student_courses_screen_page/student_courses_screen_page.dart';
import 'package:careeria/presentation/favourite_courses_screen_page/favourite_courses_screen_page.dart';
import 'package:careeria/presentation/settings_screen_page/settings_screen_page.dart';
import 'package:careeria/widgets/custom_bottom_bar.dart';
import 'models/android_large_twentythree_container_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/android_large_twentythree_container_provider.dart';

class AndroidLargeTwentythreeContainerScreen extends StatefulWidget {
  const AndroidLargeTwentythreeContainerScreen({Key? key}) : super(key: key);

  @override
  AndroidLargeTwentythreeContainerScreenState createState() =>
      AndroidLargeTwentythreeContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AndroidLargeTwentythreeContainerProvider(),
        child: AndroidLargeTwentythreeContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class AndroidLargeTwentythreeContainerScreenState
    extends State<AndroidLargeTwentythreeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.studentHomeScreenPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.studentHomeScreenPage;
      case BottomBarEnum.Contrastblack900:
        return AppRoutes.studentCoursesScreenPage;
      case BottomBarEnum.Favorite:
        return AppRoutes.favouriteCoursesScreenPage;
      case BottomBarEnum.Search:
        return AppRoutes.settingsScreenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.studentHomeScreenPage:
        return StudentHomeScreenPage.builder(context);
      case AppRoutes.studentCoursesScreenPage:
        return StudentCoursesScreenPage.builder(context);
      case AppRoutes.favouriteCoursesScreenPage:
        return FavouriteCoursesScreenPage.builder(context);
      case AppRoutes.settingsScreenPage:
        return SettingsScreenPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
