import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/introduction_2_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/introduction_2_provider.dart';

class Introduction2Screen extends StatefulWidget {
  const Introduction2Screen({Key? key}) : super(key: key);

  @override
  Introduction2ScreenState createState() => Introduction2ScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Introduction2Provider(),
        child: Introduction2Screen());
  }
}

class Introduction2ScreenState extends State<Introduction2Screen> {
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
                  _buildSeven(context),
                  _buildAndroidLarge(context)
                ])),
            bottomNavigationBar: _buildNext(context)));
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return SizedBox(
        height: 374.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle48,
              height: 374.v,
              width: 360.h,
              radius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.h),
                  bottomRight: Radius.circular(50.h)),
              alignment: Alignment.center),
          CustomAppBar(height: 63.v, actions: [
            AppbarSubtitleTwo(
                text: "lbl_skip".tr,
                margin: EdgeInsets.symmetric(horizontal: 16.h),
                onTap: () {
                  onTapSkip(context);
                })
          ])
        ]));
  }

  /// Section Widget
  Widget _buildAndroidLarge(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 38.v),
        child: Column(children: [
          SizedBox(height: 15.v),
          SizedBox(
              width: 400.h,
              child: Text("msg_we_provide_personalized".tr,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style:
                      theme.textTheme.headlineSmall!.copyWith(height: 1.46))),
          SizedBox(height: 60.v),
          SizedBox(
              height: 15.v,
              child: AnimatedSmoothIndicator(
                  activeIndex: 1,
                  count: 3,
                  effect: ScrollingDotsEffect(
                      spacing: 8,
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: appTheme.teal100.withOpacity(0.46),
                      dotHeight: 15.v,
                      dotWidth: 14.h)))
        ]));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        height: 56.v,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 22.v,top: 15.v),
        buttonStyle: CustomButtonStyles.outlineTeal,
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates to the app3Screen when the action is triggered.
  onTapSkip(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.app3Screen,
    );
  }

  /// Navigates to the app3Screen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.app3Screen,
    );
  }
}
