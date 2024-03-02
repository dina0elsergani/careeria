import 'models/tech_test_result_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/tech_test_result_provider.dart';

class TechTestResultScreen extends StatefulWidget {
  const TechTestResultScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TechTestResultScreenState createState() => TechTestResultScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TechTestResultProvider(),
      child: TechTestResultScreen(),
    );
  }
}

class TechTestResultScreenState extends State<TechTestResultScreen> {
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
          padding: EdgeInsets.symmetric(vertical: 20.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 66.v),
              Text(
                "msg_congratulations".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              Text(
                "lbl_have_scored".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              Text(
                "lbl_502".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgPrizeCupForThe,
                height: 262.v,
                width: 300.h,
              ),
              Container(
                width: 262.h,
                margin: EdgeInsets.only(
                  left: 17.h,
                  right: 21.h,
                ),
                child: Text(
                  "msg_the_right_track".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineSmallWhiteA700Regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
