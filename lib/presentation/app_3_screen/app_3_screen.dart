import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/app_3_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/app_3_provider.dart';

class App3Screen extends StatefulWidget {
  const App3Screen({Key? key}) : super(key: key);

  @override
  App3ScreenState createState() => App3ScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => App3Provider(), child: App3Screen());
  }
}

class App3ScreenState extends State<App3Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle48374x360,
                      height: 374.v,
                      width: 360.h,
                      radius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.h),
                          bottomRight: Radius.circular(50.h))),
                  SizedBox(height: 88.v),
                  Container(
                      width: 316.h,
                      margin: EdgeInsets.only(left: 22.h, right: 21.h),
                      child: Text("msg_take_a_step_ahead".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall!
                              .copyWith(height: 1.46))),
                  SizedBox(height: 95.v),
                  SizedBox(
                      height: 15.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: 0,
                          count: 3,
                          effect: ScrollingDotsEffect(
                              spacing: 8,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor: appTheme.teal100,
                              dotHeight: 15.v,
                              dotWidth: 14.h))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildStart(context)));
  }

  /// Section Widget
  Widget _buildStart(BuildContext context) {
    return CustomElevatedButton(
        height: 56.v,
        text: "lbl_start".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 22.v),
        buttonStyle: CustomButtonStyles.outlineTeal,
        onPressed: () {
          onTapStart(context);
        });
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapStart(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
