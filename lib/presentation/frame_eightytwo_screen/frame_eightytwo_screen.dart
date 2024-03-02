import 'models/frame_eightytwo_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/frame_eightytwo_provider.dart';

class FrameEightytwoScreen extends StatefulWidget {
  const FrameEightytwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FrameEightytwoScreenState createState() => FrameEightytwoScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FrameEightytwoProvider(),
      child: FrameEightytwoScreen(),
    );
  }
}

class FrameEightytwoScreenState extends State<FrameEightytwoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: 300.h,
          padding: EdgeInsets.symmetric(vertical: 23.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 60.v),
              Text(
                "msg_congratulations".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              Text(
                "lbl_have_scored".tr,
                style: CustomTextStyles.headlineSmallWhiteA700Regular,
              ),
              Text(
                "lbl_85".tr,
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
