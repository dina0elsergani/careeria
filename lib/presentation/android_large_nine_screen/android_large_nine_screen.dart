import 'package:careeria/widgets/custom_elevated_button.dart';
import 'models/android_large_nine_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/android_large_nine_provider.dart';

class AndroidLargeNineScreen extends StatefulWidget {
  const AndroidLargeNineScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AndroidLargeNineScreenState createState() => AndroidLargeNineScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AndroidLargeNineProvider(),
      child: AndroidLargeNineScreen(),
    );
  }
}

class AndroidLargeNineScreenState extends State<AndroidLargeNineScreen> {
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
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 41.h,
                  vertical: 30.v,
                ),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWomanSittingOn,
                      height: 206.adaptSize,
                      width: 206.adaptSize,
                    ),
                    Text(
                      "msg_you_are_advanced".tr,
                      style: CustomTextStyles.headlineSmallWhiteA700,
                    ),
                    SizedBox(height: 1.v),
                    Container(
                      width: 271.h,
                      margin: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "msg_to_show_the_rood".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 34.v),
                  ],
                ),
              ),
              SizedBox(height: 96.v),
              CustomElevatedButton(
                height: 46.v,
                width: 224.h,
                text: "lbl_rood_map".tr,
                buttonStyle: CustomButtonStyles.outlineTealTL102,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
