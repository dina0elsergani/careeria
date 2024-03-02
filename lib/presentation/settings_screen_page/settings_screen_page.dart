import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/custom_switch.dart';
import 'package:careeria/widgets/custom_icon_button.dart';
import 'models/settings_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/settings_screen_provider.dart';

class SettingsScreenPage extends StatefulWidget {
  const SettingsScreenPage({Key? key}) : super(key: key);

  @override
  SettingsScreenPageState createState() => SettingsScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SettingsScreenProvider(),
        child: SettingsScreenPage());
  }
}

class SettingsScreenPageState extends State<SettingsScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 24.h, right: 57.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgEllipse1265x66,
                                height: 65.v,
                                width: 66.h,
                                radius: BorderRadius.circular(33.h),
                                onTap: () {
                                  onTapImgCircleImage(context);
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 24.h, top: 17.v, bottom: 2.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            onTapTxtAnnaAlvarad(context);
                                          },
                                          child: Text("lbl_anna_alvarad".tr,
                                              style: CustomTextStyles
                                                  .titleMediumBluegray800)),
                                      SizedBox(height: 2.v),
                                      Text("msg_annaalvarado221_gmail_com".tr,
                                          style: CustomTextStyles
                                              .bodyMediumBeVietnamBluegray900)
                                    ]))
                          ])),
                      SizedBox(height: 34.v),
                      _buildFrameFiftyTwo(context),
                      SizedBox(height: 40.v),
                      _buildFrameFiftyThree(context),
                      SizedBox(height: 40.v),
                      _buildLocation(context),
                      SizedBox(height: 39.v),
                      Padding(
                          padding: EdgeInsets.only(left: 32.h, right: 51.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgCall,
                                    height: 23.v,
                                    width: 24.h,
                                    margin: EdgeInsets.only(bottom: 2.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h),
                                    child: Text("lbl_contact_us".tr,
                                        style: CustomTextStyles
                                            .titleMediumBeVietnam)),
                                Spacer(),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowRight,
                                    height: 16.v,
                                    width: 8.h,
                                    margin:
                                        EdgeInsets.only(top: 7.v, bottom: 2.v))
                              ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 34.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 21.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_settings".tr));
  }

  /// Section Widget
  Widget _buildFrameFiftyTwo(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(left: 26.h, right: 32.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgContrastOnprimary,
                      height: 36.adaptSize,
                      width: 36.adaptSize),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 20.h, top: 7.v, bottom: 4.v),
                      child: Text("lbl_dark_mode".tr,
                          style: CustomTextStyles.titleMediumBeVietnam)),
                  Spacer(),
                  Selector<SettingsScreenProvider, bool?>(
                      selector: (context, provider) =>
                          provider.isSelectedSwitch,
                      builder: (context, isSelectedSwitch, child) {
                        return CustomSwitch(
                            margin: EdgeInsets.only(bottom: 5.v),
                            value: isSelectedSwitch,
                            onChange: (value) {
                              context
                                  .read<SettingsScreenProvider>()
                                  .changeSwitchBox1(value);
                            });
                      })
                ])));
  }

  /// Section Widget
  Widget _buildFrameFiftyThree(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(bottom: 7.v)),
                  Padding(
                      padding: EdgeInsets.only(left: 24.h, bottom: 5.v),
                      child: Text("lbl_notifications".tr,
                          style: CustomTextStyles.titleMediumBeVietnam)),
                  Spacer(),
                  Selector<SettingsScreenProvider, bool?>(
                      selector: (context, provider) =>
                          provider.isSelectedSwitch1,
                      builder: (context, isSelectedSwitch1, child) {
                        return CustomSwitch(
                            value: isSelectedSwitch1,
                            onChange: (value) {
                              context
                                  .read<SettingsScreenProvider>()
                                  .changeSwitchBox2(value);
                            });
                      })
                ])));
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 32.h),
            child: IntrinsicWidth(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 26.v,
                  width: 24.h),
              Padding(
                  padding: EdgeInsets.only(left: 23.h, top: 2.v),
                  child: Text("msg_privacy_security".tr,
                      style: CustomTextStyles.titleMediumBeVietnam)),
              Spacer(flex: 58),
              CustomIconButton(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.all(3.h),
                  child:
                      CustomImageView(imagePath: ImageConstant.imgArrowRight)),
              Spacer(flex: 41),
              Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: CustomIconButton(
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      padding: EdgeInsets.all(3.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRight)))
            ]))));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the studentProfileScreen when the action is triggered.
  onTapImgCircleImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.studentProfileScreen,
    );
  }

  /// Navigates to the studentProfileScreen when the action is triggered.
  onTapTxtAnnaAlvarad(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.studentProfileScreen,
    );
  }
}
