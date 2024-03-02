import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/course_test_success_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/course_test_success_provider.dart';

class CourseTestSuccessScreen extends StatefulWidget {
  const CourseTestSuccessScreen({Key? key}) : super(key: key);

  @override
  CourseTestSuccessScreenState createState() => CourseTestSuccessScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CourseTestSuccessProvider(),
        child: CourseTestSuccessScreen());
  }
}

class CourseTestSuccessScreenState extends State<CourseTestSuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.teal100,
            body: Container(
                width: 300.h,
                padding: EdgeInsets.symmetric(vertical: 14.v),
                child: Column(children: [
                  SizedBox(height: 29.v),
                  Text("msg_congratulations".tr,
                      style: CustomTextStyles.headlineSmallWhiteA700Regular),
                  Text("lbl_have_scored".tr,
                      style: CustomTextStyles.headlineSmallWhiteA700Regular),
                  Text("lbl_80".tr,
                      style: CustomTextStyles.headlineSmallWhiteA700Regular),
                  SizedBox(
                      height: 312.v,
                      width: 300.h,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgPrizeCupForThe,
                            height: 262.v,
                            width: 300.h,
                            alignment: Alignment.topCenter),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("msg_you_have_passed".tr,
                                style: CustomTextStyles.titleLargeMedium)),
                        CustomImageView(
                            imagePath: ImageConstant.imgBigFirework,
                            height: 312.v,
                            width: 300.h,
                            alignment: Alignment.center)
                      ]))
                ])),
            bottomNavigationBar: _buildContinue(context)));
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 21.h, right: 21.h, bottom: 22.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomElevatedButton(
              height: 45.v,
              width: 120.h,
              text: "lbl_continue".tr,
              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
              onPressed: () {
                onTapContinue(context);
              }),
          CustomElevatedButton(
              height: 45.v,
              width: 130.h,
              text: "lbl_once_again".tr,
              margin: EdgeInsets.only(left: 8.h),
              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
              onPressed: () {
                onTapOnceAgain(context);
              })
        ]));
  }

  /// Navigates to the courseViewScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.courseViewScreen,
    );
  }

  /// Navigates to the testScreen when the action is triggered.
  onTapOnceAgain(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.testScreen,
    );
  }
}
