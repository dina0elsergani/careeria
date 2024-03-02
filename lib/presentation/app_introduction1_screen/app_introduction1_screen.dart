import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/app_introduction1_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/app_introduction1_provider.dart';

class AppIntroduction1Screen extends StatefulWidget {
  const AppIntroduction1Screen({Key? key}) : super(key: key);

  @override
  AppIntroduction1ScreenState createState() => AppIntroduction1ScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppIntroduction1Provider(),
        child: AppIntroduction1Screen());
  }
}

class AppIntroduction1ScreenState extends State<AppIntroduction1Screen> {
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
                  _buildSix(context),
                  SizedBox(height: 91.v),
                  Container(
                      width: 267.h,
                      margin: EdgeInsets.only(left: 49.h, right: 42.h),
                      child: Text("msg_do_you_need_a_special".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall!
                              .copyWith(height: 1.46))),
                  SizedBox(height: 97.v),
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
            bottomNavigationBar: _buildNext(context)));
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return SizedBox(
        height: 374.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topRight, children: [
          CustomImageView(
              imagePath: ImageConstant.imgArtificialIntelligence,
              height: 374.v,
              width: 360.h,
              radius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.h),
                  bottomRight: Radius.circular(50.h)),
              alignment: Alignment.center),
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    onTapTxtSkip(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 33.v, right: 16.h),
                      child: Text("lbl_skip".tr,
                          style: CustomTextStyles.titleLargePrimary_1))))
        ]));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        height: 56.v,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 17.v),
        buttonStyle: CustomButtonStyles.outlineTeal,
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates to the introduction2Screen when the action is triggered.
  onTapTxtSkip(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introduction2Screen,
    );
  }

  /// Navigates to the introduction2Screen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introduction2Screen,
    );
  }
}
