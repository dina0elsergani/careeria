import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:careeria/widgets/custom_outlined_button.dart';
import 'widgets/androidlargetwentyfour_item_widget.dart';
import 'models/androidlargetwentyfour_item_model.dart';
import 'models/course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/course_view_provider.dart';

class CourseViewScreen extends StatefulWidget {
  const CourseViewScreen({Key? key}) : super(key: key);

  @override
  CourseViewScreenState createState() => CourseViewScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CourseViewProvider(), child: CourseViewScreen());
  }
}

class CourseViewScreenState extends State<CourseViewScreen> {
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
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 9.v),
                        padding: EdgeInsets.symmetric(horizontal: 14.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text("msg_introduction_to2".tr,
                                      style: theme.textTheme.titleMedium)),
                              SizedBox(height: 6.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 294.h,
                                      margin: EdgeInsets.only(
                                          left: 25.h, right: 12.h),
                                      child: Text("msg_the_focus_of_this".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyMediumBlack900Regular))),
                              SizedBox(height: 6.v),
                              _buildOverview(context),
                              SizedBox(height: 7.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 27.h),
                                  child: Text("lbl_4_10_completed".tr,
                                      style:
                                          CustomTextStyles.bodyMediumRegular)),
                              SizedBox(height: 8.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Container(
                                      height: 33.v,
                                      width: 328.h,
                                      decoration: BoxDecoration(
                                          color: appTheme.indigo50,
                                          borderRadius:
                                              BorderRadius.circular(10.h)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                          child: LinearProgressIndicator(
                                              value: 0.51,
                                              backgroundColor:
                                                  appTheme.indigo50,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      theme.colorScheme
                                                          .primary))))),
                              SizedBox(height: 13.v),
                              _buildAndroidLargeTwentyFour(context)
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 26.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 16.h, top: 20.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitleOne(
            text: "lbl_course_1".tr, margin: EdgeInsets.only(left: 14.h)));
  }

  /// Section Widget
  Widget _buildOverview(BuildContext context) {
    return CustomOutlinedButton(
        height: 35.v,
        width: 112.h,
        text: "lbl_overview".tr,
        margin: EdgeInsets.only(left: 27.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL17,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium);
  }

  /// Section Widget
  Widget _buildAndroidLargeTwentyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child:
            Consumer<CourseViewProvider>(builder: (context, provider, child) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 13.v);
              },
              itemCount: provider
                  .courseViewModelObj.androidlargetwentyfourItemList.length,
              itemBuilder: (context, index) {
                AndroidlargetwentyfourItemModel model = provider
                    .courseViewModelObj.androidlargetwentyfourItemList[index];
                return AndroidlargetwentyfourItemWidget(model, onTapStart: () {
                  onTapStart(context);
                });
              });
        }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the courseVideosScreen when the action is triggered.
  onTapStart(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.courseVideosScreen,
    // );
  }
}
