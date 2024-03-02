import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_title.dart';
import 'package:careeria/widgets/custom_radio_button.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/soft_test_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/soft_test_provider.dart';

class SoftTestScreen extends StatefulWidget {
  const SoftTestScreen({Key? key}) : super(key: key);

  @override
  SoftTestScreenState createState() => SoftTestScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SoftTestProvider(), child: SoftTestScreen());
  }
}

class SoftTestScreenState extends State<SoftTestScreen> {
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
                margin: EdgeInsets.only(top: 27.v),
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 72.v),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                    image: DecorationImage(
                        image: fs.Svg(ImageConstant.imgSignUp),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOne(context),
                      SizedBox(height: 31.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("lbl_9".tr, style: theme.textTheme.bodyLarge),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text("lbl_10".tr,
                                    style: theme.textTheme.bodyLarge))
                          ]),
                      SizedBox(height: 39.v),
                      Container(
                          width: 304.h,
                          margin: EdgeInsets.only(left: 12.h, right: 13.h),
                          child: Text("msg_how_likely_do_you".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleMediumWhiteA700)),
                      SizedBox(height: 65.v),
                      _buildGroup502(context),
                      SizedBox(height: 64.v),
                      _buildTf(context),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 35.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 25.h, top: 20.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "msg_soft_skills_test".tr));
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 4.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("lbl_1".tr, style: theme.textTheme.bodyLarge),
          Spacer(flex: 17),
          Text("lbl_2".tr, style: theme.textTheme.bodyLarge),
          Spacer(flex: 16),
          Text("lbl_3".tr, style: theme.textTheme.bodyLarge),
          Spacer(flex: 16),
          Text("lbl_4".tr, style: theme.textTheme.bodyLarge),
          Spacer(flex: 16),
          Text("lbl_5".tr, style: theme.textTheme.bodyLarge),
          Spacer(flex: 17),
          Text("lbl_6".tr, style: theme.textTheme.bodyLarge),
          Container(
              height: 24.v,
              width: 20.h,
              margin: EdgeInsets.only(left: 28.h),
              child: Stack(alignment: Alignment.centerLeft, children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadius.circular(10.h)))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text("lbl_7".tr,
                            style: CustomTextStyles.bodyLargePrimary)))
              ])),
          Spacer(flex: 15),
          Text("lbl_8".tr, style: theme.textTheme.bodyLarge)
        ]));
  }

  /// Section Widget
  Widget _buildGroup502(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Consumer<SoftTestProvider>(builder: (context, provider, child) {
          return provider.softTestModelObj!.radioList.isNotEmpty
              ? Column(children: [
                  CustomRadioButton(
                      text: "msg_not_likely_at_all".tr,
                      value: provider.softTestModelObj?.radioList[0] ?? "",
                      groupValue: provider.radioGroup,
                      padding: EdgeInsets.fromLTRB(19.h, 11.v, 30.h, 11.v),
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      }),
                  Padding(
                      padding: EdgeInsets.only(top: 24.v),
                      child: CustomRadioButton(
                          text: "lbl_extremely_like".tr,
                          value: provider.softTestModelObj?.radioList[1] ?? "",
                          groupValue: provider.radioGroup,
                          padding: EdgeInsets.fromLTRB(19.h, 10.v, 30.h, 10.v),
                          onChange: (value) {
                            provider.changeRadioButton1(value);
                          })),
                  Padding(
                      padding: EdgeInsets.only(top: 24.v),
                      child: CustomRadioButton(
                          text: "lbl_both".tr,
                          value: provider.softTestModelObj?.radioList[2] ?? "",
                          groupValue: provider.radioGroup,
                          padding: EdgeInsets.fromLTRB(19.h, 9.v, 30.h, 9.v),
                          onChange: (value) {
                            provider.changeRadioButton1(value);
                          }))
                ])
              : Container();
        }));
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  height: 44.v,
                  text: "lbl".tr,
                  margin: EdgeInsets.only(right: 14.h),
                  buttonStyle: CustomButtonStyles.fillWhiteA,
                  buttonTextStyle: CustomTextStyles.titleLargePrimary_1)),
          Expanded(
              child: CustomElevatedButton(
                  height: 44.v,
                  text: "lbl_done".tr,
                  margin: EdgeInsets.only(left: 14.h),
                  buttonTextStyle: theme.textTheme.titleLarge!,
                  onPressed: () {
                    onTapDone(context);
                  }))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the softTestResultScreen when the action is triggered.
  onTapDone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.softTestResultScreen,
    );
  }
}
