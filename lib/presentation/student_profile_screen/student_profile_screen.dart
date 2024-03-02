import 'package:careeria/widgets/custom_drop_down.dart';
import 'models/student_profile_model.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/student_profile_provider.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  StudentProfileScreenState createState() => StudentProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StudentProfileProvider(),
        child: StudentProfileScreen());
  }
}

class StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topCenter, children: [
                  _buildFrameThree(context),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 42.v),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL20),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            _buildAppBar(context),
                            SizedBox(height: 38.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgEllipse1,
                                height: 110.adaptSize,
                                width: 110.adaptSize,
                                radius: BorderRadius.circular(55.h)),
                            SizedBox(height: 39.v),
                            SizedBox(
                                height: 30.v,
                                width: 153.h,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text("lbl_anna_alvarado".tr,
                                              style: CustomTextStyles
                                                  .titleLargeBluegray800)),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text("lbl_anna_alvarado".tr,
                                              style: CustomTextStyles
                                                  .titleLargeBluegray800))
                                    ])),
                            SizedBox(height: 1.v),
                            Text("msg_annaalvarado221_gmail_com".tr,
                                style: CustomTextStyles
                                    .titleSmallPoppinsBluegray700),
                            SizedBox(height: 26.v),
                            CustomElevatedButton(
                                text: "lbl_edit_profile".tr,
                                margin:
                                    EdgeInsets.only(left: 50.h, right: 51.h),
                                buttonTextStyle:
                                    CustomTextStyles.titleLargeSemiBold,
                                onPressed: () {
                                  onTapEditProfile(context);
                                }),
                            SizedBox(height: 12.v)
                          ])))
                ]))));
  }

  /// Section Widget
  Widget _buildFrameThree(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 84.v),
            decoration: AppDecoration.fillGray50.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL15,
                image: DecorationImage(
                    image: fs.Svg(ImageConstant.imgFrame3), fit: BoxFit.cover)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgGlobe,
                                height: 16.v,
                                width: 20.h,
                                margin: EdgeInsets.symmetric(vertical: 5.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 14.h, top: 2.v),
                                child: Text("lbl_language".tr,
                                    style: CustomTextStyles.titleMediumMedium)),
                            Spacer(),
                            Padding(
                                padding: EdgeInsets.only(bottom: 5.v),
                                child: Selector<StudentProfileProvider,
                                        StudentProfileModel?>(
                                    selector: (context, provider) =>
                                        provider.studentProfileModelObj,
                                    builder: (context, studentProfileModelObj,
                                        child) {
                                      return CustomDropDown(
                                          width: 80.h,
                                          hintText: "lbl_english".tr,
                                          items: studentProfileModelObj
                                                  ?.dropdownItemList ??
                                              [],
                                          onChanged: (value) {
                                            context
                                                .read<StudentProfileProvider>()
                                                .onSelected(value);
                                          });
                                    }))
                          ])),
                  SizedBox(height: 25.v),
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgThumbsUp,
                                height: 15.v,
                                width: 14.h,
                                margin: EdgeInsets.only(bottom: 6.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text("lbl_delete_account".tr,
                                    style: CustomTextStyles.titleMediumMedium)),
                            Spacer(),
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                                height: 20.v,
                                width: 10.h,
                                margin: EdgeInsets.only(top: 3.v))
                          ])),
                  SizedBox(height: 30.v),
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgThumbsUpBlack900,
                                height: 18.v,
                                width: 16.h,
                                margin: EdgeInsets.only(bottom: 5.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("lbl_log_out".tr,
                                    style: theme.textTheme.titleMedium))
                          ])),
                  SizedBox(height: 44.v)
                ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 36.v,
        leadingWidth: 26.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 6.v, bottom: 9.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_my_profile".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapEditProfile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
