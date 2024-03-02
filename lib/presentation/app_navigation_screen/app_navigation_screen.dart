import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "signup_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signupScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "splash_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "app_introduction1_screen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.appIntroduction1Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "introduction_2_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.introduction2Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "app_3_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.app3Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "login_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "avatar_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.avatarScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "tech_soft_selection_screen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.techSoftSelectionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "soft_test_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.softTestScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "technical_test_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.technicalTestScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "tech_third_test_result".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.techThirdTestResultScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Android Large - Eight".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.androidLargeEightScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Android Large - Nine".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.androidLargeNineScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "course_view_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.courseViewScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "course_videos_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.courseVideosScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                              "Android Large - TwentyThree - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.androidLargeTwentythreeContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "student_profile_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.studentProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "edit_profile_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "test_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.testScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "soft_test_result_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.softTestResultScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "tech_test_result_screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.techTestResultScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Frame EightyOne".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.frameEightyoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Frame EightyTwo".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.frameEightytwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "course_test_success_screen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.courseTestSuccessScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "course_test_failure_screen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.courseTestFailureScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
