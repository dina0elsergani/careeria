import 'package:careeria/presentation/student_home_screen_page/student_home_screen_page.dart';
import 'package:careeria/presentation/student_courses_screen_page/student_courses_screen_page.dart';
import 'package:careeria/presentation/favourite_courses_screen_page/favourite_courses_screen_page.dart';
import 'package:careeria/presentation/settings_screen_page/settings_screen_page.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/custom_icon_button.dart';
import 'widgets/androidlargetwenty_item_widget.dart';
import 'models/androidlargetwenty_item_model.dart';
import 'models/course_videos_model.dart';
import 'package:careeria/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/course_videos_provider.dart';

class CourseVideosScreen extends StatefulWidget {
  const CourseVideosScreen({Key? key}) : super(key: key);

  @override
  CourseVideosScreenState createState() => CourseVideosScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CourseVideosProvider(),
        child: CourseVideosScreen());
  }
}

// ignore_for_file: must_be_immutable
class CourseVideosScreenState extends State<CourseVideosScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.v),
                      _buildMap(context),
                      SizedBox(height: 16.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_user_researcher".tr,
                              style: CustomTextStyles.titleMediumBold)),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_brian_susan".tr,
                              style:
                                  CustomTextStyles.labelMediumPoppinsGray500)),
                      SizedBox(height: 16.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_lectures".tr,
                              style: CustomTextStyles.labelLargeGray500)),
                      SizedBox(height: 4.v),
                      _buildFiveThousandFiveHundredOne(context)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 31.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 21.h, top: 19.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_course_videos".tr));
  }

  /// Section Widget
  Widget _buildMap(BuildContext context) {
    return SizedBox(
        height: 225.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 225.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle30,
                        height: 225.v,
                        width: 360.h,
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 32.h, top: 11.v, right: 32.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 4.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                    height: 29.v,
                                                    width: 31.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 6.h,
                                                            vertical: 5.v),
                                                    decoration: AppDecoration
                                                        .fillBlack
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder15),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgMap,
                                                        height: 18.adaptSize,
                                                        width: 18.adaptSize,
                                                        alignment: Alignment
                                                            .topRight)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h),
                                                    child: CustomIconButton(
                                                        height: 29.v,
                                                        width: 31.h,
                                                        child: CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgPlay)))
                                              ]))),
                                  SizedBox(height: 41.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 12.v, bottom: 11.v),
                                            child: CustomIconButton(
                                                height: 40.v,
                                                width: 42.h,
                                                padding: EdgeInsets.all(6.h),
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .fillBlack,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgSettings))),
                                        CustomIconButton(
                                            height: 63.v,
                                            width: 65.h,
                                            padding: EdgeInsets.all(15.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlackTL32,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgThumbsUpWhiteA700)),
                                        Container(
                                            height: 40.v,
                                            width: 42.h,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 11.v),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CustomImageView(
                                                      imagePath:
                                                          ImageConstant.imgPlay,
                                                      height: 40.v,
                                                      width: 42.h,
                                                      alignment:
                                                          Alignment.center),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgSettingsWhiteA700,
                                                      height: 26.v,
                                                      width: 28.h,
                                                      alignment:
                                                          Alignment.center)
                                                ]))
                                      ])
                                ])))
                  ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 2.v,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 35.v),
                  child: Stack(alignment: Alignment.centerLeft, children: [
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                                color: theme.colorScheme.onPrimaryContainer))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            width: 159.h,
                            child: Divider(color: appTheme.blue400)))
                  ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.v),
                  decoration: AppDecoration.fillBlack900,
                  child: Text("lbl_30_08_1_20_02".tr,
                      style: CustomTextStyles.labelSmallWhiteA700Black)))
        ]));
  }

  /// Section Widget
  Widget _buildFiveThousandFiveHundredOne(BuildContext context) {
    return SizedBox(
        height: 373.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h, bottom: 20.v),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 99.v,
                            width: 127.h,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                          height: 95.v,
                                          width: 127.h,
                                          child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgRectangle29,
                                                    height: 95.v,
                                                    width: 127.h,
                                                    radius:
                                                        BorderRadius.circular(
                                                            10.h),
                                                    alignment:
                                                        Alignment.center),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.h,
                                                            right: 103.h,
                                                            bottom: 3.v),
                                                        decoration: AppDecoration
                                                            .fillBlack9001
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder1),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left: 3
                                                                              .h),
                                                                  child: Text(
                                                                      "lbl_55_01"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .poppinsWhiteA700)),
                                                              SizedBox(
                                                                  height: 3.v),
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child: SizedBox(
                                                                      width:
                                                                          108.h,
                                                                      child: Divider(
                                                                          color:
                                                                              appTheme.redA700)))
                                                            ])))
                                              ]))),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(bottom: 3.v),
                                          child: SizedBox(
                                              width: 108.h,
                                              child: Divider(
                                                  color: appTheme.redA700)))),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgIcBaselineSettings,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      alignment: Alignment.bottomCenter)
                                ])),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 24.h, top: 15.v, bottom: 45.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_ui_ux_design".tr,
                                      style: theme.textTheme.labelLarge),
                                  SizedBox(height: 7.v),
                                  Text("lbl_brian_susan".tr,
                                      style: theme.textTheme.labelSmall)
                                ]))
                      ]))),
          Align(
              alignment: Alignment.center,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Divider(
                    color:
                        theme.colorScheme.onPrimaryContainer.withOpacity(0.5)),
                SizedBox(height: 15.v),
                Consumer<CourseVideosProvider>(
                    builder: (context, provider, child) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 11.5.v),
                            child: SizedBox(
                                width: 108.h,
                                child: Divider(
                                    height: 1.v,
                                    thickness: 1.v,
                                    color: appTheme.redA700)));
                      },
                      itemCount: provider.courseVideosModelObj
                          .androidlargetwentyItemList.length,
                      itemBuilder: (context, index) {
                        AndroidlargetwentyItemModel model = provider
                            .courseVideosModelObj
                            .androidlargetwentyItemList[index];
                        return AndroidlargetwentyItemWidget(model);
                      });
                })
              ]))
        ]));
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

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
