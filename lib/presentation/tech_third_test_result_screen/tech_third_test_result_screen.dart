import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/tech_third_test_result_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/tech_third_test_result_provider.dart';

class TechThirdTestResultScreen extends StatefulWidget {
  const TechThirdTestResultScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TechThirdTestResultScreenState createState() =>
      TechThirdTestResultScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TechThirdTestResultProvider(),
      child: TechThirdTestResultScreen(),
    );
  }
}

class TechThirdTestResultScreenState extends State<TechThirdTestResultScreen> {
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 42.h,
                  vertical: 30.v,
                ),
                decoration: AppDecoration.fillTeal.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWomanWritingCode,
                      height: 206.adaptSize,
                      width: 206.adaptSize,
                    ),
                    SizedBox(height: 1.v),
                    Text(
                      "msg_you_are_a_beginner".tr,
                      style: CustomTextStyles.headlineSmallWhiteA700,
                    ),
                    SizedBox(height: 34.v),
                    SizedBox(
                      width: 271.h,
                      child: Text(
                        "msg_to_show_the_rood".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 96.v),
              CustomElevatedButton(
                onPressed: onTap,
                height: 46.v,
                width: 224.h,
                text: "lbl_rood_map".tr,
                buttonStyle: CustomButtonStyles.outlineTealTL10,
                buttonTextStyle: CustomTextStyles.headlineSmallWhiteA700Medium,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
    void onTap () {
    NavigatorService.pushNamed(
      AppRoutes.androidLargeTwentythreeContainerScreen,
    );
  }
}
