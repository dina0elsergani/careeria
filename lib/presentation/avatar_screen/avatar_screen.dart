import 'widgets/androidlargesix_item_widget.dart';
import 'models/androidlargesix_item_model.dart';
import 'models/avatar_model.dart';
import 'package:careeria/widgets/custom_text_form_field.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildThree(context),
                  SizedBox(height: 49.v),
                  _buildAndroidLargeSix(context),
                  SizedBox(height: 48.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 25.h),
                          child: Text("lbl_name".tr,
                              style: CustomTextStyles.titleMediumMedium))),
                  SizedBox(height: 8.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Selector<AvatarProvider, TextEditingController?>(
                          selector: (context, provider) =>
                              provider.nameController,
                          builder: (context, nameController, child) {
                            return CustomTextFormField(
                                controller: nameController,
                                textInputAction: TextInputAction.done,
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlinePrimary,
                                fillColor: appTheme.whiteA700);
                          })),
                  SizedBox(height: 33.v),
                  CustomElevatedButton(
                      text: "lbl_continue".tr,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      onPressed: () {
                        onTapContinue(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
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

  /// Section Widget
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
                    return AndroidlargesixItemWidget(model);
                  });
            })));
  }

  /// Navigates to the techSoftSelectionScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.techSoftSelectionScreen,
    );
  }
}
