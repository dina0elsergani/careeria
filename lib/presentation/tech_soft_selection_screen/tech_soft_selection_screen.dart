import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/tech_soft_selection_provider.dart';

class TechSoftSelectionScreen extends StatefulWidget {
  const TechSoftSelectionScreen({Key? key}) : super(key: key);

  @override
  TechSoftSelectionScreenState createState() => TechSoftSelectionScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TechSoftSelectionProvider(),
        child: TechSoftSelectionScreen());
  }
}

class TechSoftSelectionScreenState extends State<TechSoftSelectionScreen> {
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
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 461.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.teal100,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.h))))),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 24.v),
                          decoration: AppDecoration.outlineTeal.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL30),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgWomanSittingAt,
                                    height: 264.v,
                                    width: 348.h),
                                SizedBox(height: 24.v),
                                CustomElevatedButton(
                                    text: "lbl_technical".tr,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 44.h),
                                    buttonStyle: CustomButtonStyles.fillTeal,
                                    onPressed: () {
                                      onTapTechnical(context);
                                    }),
                                SizedBox(height: 4.v)
                              ]))),
                  _buildFrameThirtyNine(context)
                ]))));
  }

  /// Section Widget
  Widget _buildFrameThirtyNine(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(bottom: 37.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgMultitaskingYoung,
                  height: 264.v,
                  width: 360.h),
              SizedBox(height: 24.v),
              CustomElevatedButton(
                  text: "lbl_soft_skills".tr,
                  margin: EdgeInsets.symmetric(horizontal: 50.h),
                  onPressed: () {
                    onTapSoftSkills(context);
                  })
            ])));
  }

  /// Navigates to the technicalTestScreen when the action is triggered.
  onTapTechnical(BuildContext context) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTechSelected', true);
    NavigatorService.pushNamed(
      AppRoutes.technicalTestScreen,
    );
  }

  /// Navigates to the softTestScreen when the action is triggered.
  onTapSoftSkills(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.softTestScreen,
    );
  }
}
