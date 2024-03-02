import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/course_test_failure_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/course_test_failure_provider.dart';

class CourseTestFailureScreen extends StatefulWidget {
  const CourseTestFailureScreen({Key? key}) : super(key: key);

  @override
  CourseTestFailureScreenState createState() => CourseTestFailureScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CourseTestFailureProvider(),
        child: CourseTestFailureScreen());
  }
}

class CourseTestFailureScreenState extends State<CourseTestFailureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.teal100,
            body: SizedBox(
                width: 300.h,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle47,
                      height: 235.v,
                      width: 300.h,
                      radius: BorderRadius.circular(10.h)),
                  SizedBox(height: 71.v),
                  Container(
                      width: 252.h,
                      margin: EdgeInsets.symmetric(horizontal: 23.h),
                      child: Text("msg_unfortunately_you".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleLargeSemiBold)),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildTryAgain(context)));
  }

  /// Section Widget
  Widget _buildTryAgain(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_try_again".tr,
        margin: EdgeInsets.only(left: 38.h, right: 38.h, bottom: 52.v),
        buttonTextStyle: CustomTextStyles.titleLargeSemiBold,
        onPressed: () {
          onTapTryAgain(context);
        });
  }

  /// Navigates to the testScreen when the action is triggered.
  onTapTryAgain(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.testScreen,
    );
  }
}
