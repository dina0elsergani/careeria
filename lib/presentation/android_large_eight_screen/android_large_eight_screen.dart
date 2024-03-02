import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/android_large_eight_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/android_large_eight_provider.dart';

class AndroidLargeEightScreen extends StatefulWidget {
  const AndroidLargeEightScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AndroidLargeEightScreenState createState() => AndroidLargeEightScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AndroidLargeEightProvider(),
      child: AndroidLargeEightScreen(),
    );
  }
}

class AndroidLargeEightScreenState extends State<AndroidLargeEightScreen> {
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
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgManDoingCoding,
                      height: 206.adaptSize,
                      width: 206.adaptSize,
                    ),
                    SizedBox(height: 1.v),
                    Text(
                      "msg_you_are_experienced".tr,
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
                height: 46.v,
                width: 224.h,
                text: "lbl_rood_map".tr,
                buttonStyle: CustomButtonStyles.outlineTealTL101,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
