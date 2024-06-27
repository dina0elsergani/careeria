import 'package:careeria/presentation/avatar_screen/models/androidlargesix_item_model.dart';
import 'package:careeria/presentation/avatar_screen/widgets/androidlargesix_item_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/avatar_provider.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  AvatarScreenState createState() => AvatarScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AvatarProvider(), child: AvatarScreen());
  }
}

class AvatarScreenState extends State<AvatarScreen> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initializePrefs();
  }

  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setSelectedAvatar(String avatarPath) async {
    if (avatarPath.isNotEmpty) { // Ensure the avatarPath is not empty
      await prefs?.setString('userAvatar', avatarPath);
      NavigatorService.pushNamed(AppRoutes.techSoftSelectionScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildThree(context),
              SizedBox(height: 49.v),
              Expanded(child: _buildAndroidLargeSix(context)), // Use Expanded to ensure proper layout
              SizedBox(height: 48.v),
              SizedBox(height: 45.v),
              CustomElevatedButton(
                width: 200.h,
                text: "Continue",
                onPressed: () => NavigatorService.pushNamed(AppRoutes.techSoftSelectionScreen),
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAndroidLargeSix(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 70.v,
            child:
                Consumer<AvatarProvider>(builder: (context, provider, child) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 24.h);
                  },
                  itemCount:
                      provider.avatarModelObj.androidlargesixItemList.length,
                  itemBuilder: (context, index) {
                    AndroidlargesixItemModel model =
                        provider.avatarModelObj.androidlargesixItemList[index];
                    return AndroidlargesixItemWidget(model:model,onTap:(avatarPath) => setSelectedAvatar(model.ellipse ?? ""));
                  });
            })));
  }


  /// Section Widget
  Widget _buildThree(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 119.v),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.customBorderBL30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 19.v),
              Text("msg_lets_get_started".tr,
                  style: CustomTextStyles.headlineLargeWhiteA700),
              SizedBox(
                  width: 329.h,
                  child: Text("msg_enter_name_and_select".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge))
            ]));
  }
}
