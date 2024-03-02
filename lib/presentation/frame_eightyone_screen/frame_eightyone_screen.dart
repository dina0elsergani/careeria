import 'models/frame_eightyone_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/frame_eightyone_provider.dart';

class FrameEightyoneScreen extends StatefulWidget {
  const FrameEightyoneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FrameEightyoneScreenState createState() => FrameEightyoneScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FrameEightyoneProvider(),
      child: FrameEightyoneScreen(),
    );
  }
}

class FrameEightyoneScreenState extends State<FrameEightyoneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.teal200,
        body: Container(
          width: 300.h,
          padding: EdgeInsets.symmetric(vertical: 21.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 64.v),
              Text(
                "msg_congratulations".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              Text(
                "lbl_have_scored".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              Text(
                "lbl_70".tr,
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
                  left: 21.h,
                  right: 17.h,
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
