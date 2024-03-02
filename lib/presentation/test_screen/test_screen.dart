import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_title.dart';
import 'package:careeria/widgets/custom_radio_button.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/test_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/test_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  TestScreenState createState() => TestScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TestProvider(), child: TestScreen());
  }
}

class TestScreenState extends State<TestScreen> {
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
                margin: EdgeInsets.only(top: 38.v),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 64.v),
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
                      SizedBox(height: 40.v),
                      Container(
                          width: 304.h,
                          margin: EdgeInsets.symmetric(horizontal: 11.h),
                          child: Text("msg_how_likely_do_you".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleMediumWhiteA700)),
                      SizedBox(height: 71.v),
                      _buildGroup487(context),
                      SizedBox(height: 64.v),
                      _buildTf(context),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 26.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 16.h, top: 17.v, bottom: 18.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_test".tr));
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return SizedBox(
        height: 80.v,
        width: 326.h,
        child: Stack(alignment: Alignment.topRight, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 80.v,
                  width: 326.h,
                  child: Stack(alignment: Alignment.topRight, children: [
                    Align(
                        alignment: Alignment.center,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("lbl_1".tr,
                                    style: theme.textTheme.bodyLarge),
                                Spacer(flex: 13),
                                Text("lbl_2".tr,
                                    style: theme.textTheme.bodyLarge),
                                Spacer(flex: 13),
                                Text("lbl_3".tr,
                                    style: theme.textTheme.bodyLarge),
                                Spacer(flex: 13),
                                Text("lbl_4".tr,
                                    style: theme.textTheme.bodyLarge),
                                Spacer(flex: 13),
                                Text("lbl_5".tr,
                                    style: theme.textTheme.bodyLarge),
                                Spacer(flex: 13),
                                Text("lbl_6".tr,
                                    style: theme.textTheme.bodyLarge),
                                Spacer(flex: 30),
                                Text("lbl_8".tr,
                                    style: theme.textTheme.bodyLarge)
                              ]),
                          SizedBox(height: 31.v),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("lbl_9".tr,
                                    style: theme.textTheme.bodyLarge),
                                Padding(
                                    padding: EdgeInsets.only(left: 31.h),
                                    child: Text("lbl_10".tr,
                                        style: theme.textTheme.bodyLarge))
                              ])
                        ])),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(right: 42.h),
                            decoration: BoxDecoration(
                                color: appTheme.whiteA700,
                                borderRadius: BorderRadius.circular(10.h))))
                  ]))),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 48.h),
                  child: Text("lbl_7".tr,
                      style: CustomTextStyles.bodyLargePrimary)))
        ]));
  }

  /// Section Widget
  Widget _buildGroup487(BuildContext context) {
    return Consumer<TestProvider>(builder: (context, provider, child) {
      return provider.testModelObj!.radioList.isNotEmpty
          ? Column(children: [
              CustomRadioButton(
                  text: "msg_not_likely_at_all".tr,
                  value: provider.testModelObj?.radioList[0] ?? "",
                  groupValue: provider.radioGroup,
                  padding: EdgeInsets.fromLTRB(16.h, 11.v, 30.h, 11.v),
                  onChange: (value) {
                    provider.changeRadioButton1(value);
                  }),
              Padding(
                  padding: EdgeInsets.only(top: 24.v),
                  child: CustomRadioButton(
                      text: "lbl_extremely_like".tr,
                      value: provider.testModelObj?.radioList[1] ?? "",
                      groupValue: provider.radioGroup,
                      padding: EdgeInsets.fromLTRB(16.h, 10.v, 30.h, 10.v),
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      })),
              Padding(
                  padding: EdgeInsets.only(top: 24.v),
                  child: CustomRadioButton(
                      text: "lbl_both".tr,
                      value: provider.testModelObj?.radioList[2] ?? "",
                      groupValue: provider.radioGroup,
                      padding: EdgeInsets.fromLTRB(16.h, 9.v, 30.h, 9.v),
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      }))
            ])
          : Container();
    });
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the courseTestSuccessScreen when the action is triggered.
  onTapDone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.courseTestSuccessScreen,
    );
  }
}
