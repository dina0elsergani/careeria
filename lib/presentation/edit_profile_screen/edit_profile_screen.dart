import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:careeria/widgets/custom_icon_button.dart';
import 'package:careeria/widgets/custom_text_form_field.dart';
import 'package:careeria/core/utils/validation_functions.dart';
import 'package:careeria/widgets/custom_drop_down.dart';
import 'models/edit_profile_model.dart';
import 'package:careeria/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/edit_profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  EditProfileScreenState createState() => EditProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EditProfileProvider(), child: EditProfileScreen());
  }
}

// ignore_for_file: must_be_immutable
class EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray50,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 17.v),
                            child: Column(children: [
                              SizedBox(height: 25.v),
                              Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.h),
                                  decoration: AppDecoration.outlineBlueGray
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL20),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            height: 111.v,
                                            width: 110.h,
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          height: 110.adaptSize,
                                                          width: 110.adaptSize,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.h),
                                                          decoration: AppDecoration
                                                              .fillPrimary1
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder55),
                                                          child: CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgEllipse8,
                                                              height:
                                                                  105.adaptSize,
                                                              width:
                                                                  105.adaptSize,
                                                              radius:
                                                                  BorderRadius.circular(
                                                                      52.h),
                                                              alignment:
                                                                  Alignment
                                                                      .center))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 3.h),
                                                      child: CustomIconButton(
                                                          height: 40.adaptSize,
                                                          width: 40.adaptSize,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.h),
                                                          decoration:
                                                              IconButtonStyleHelper
                                                                  .fillBlue,
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgPhCameraLight)))
                                                ])),
                                        SizedBox(height: 28.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("lbl_full_name".tr,
                                                style: theme
                                                    .textTheme.titleMedium)),
                                        SizedBox(height: 4.v),
                                        _buildFullName(context),
                                        SizedBox(height: 5.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("lbl_e_mail2".tr,
                                                style: theme
                                                    .textTheme.titleMedium)),
                                        SizedBox(height: 5.v),
                                        _buildEmail(context),
                                        SizedBox(height: 6.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("lbl_phone_number".tr,
                                                style: theme
                                                    .textTheme.titleMedium)),
                                        SizedBox(height: 4.v),
                                        _buildPhoneNumber(context),
                                        SizedBox(height: 5.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("lbl_data_of_birth".tr,
                                                style: theme
                                                    .textTheme.titleMedium)),
                                        SizedBox(height: 5.v),
                                        Selector<EditProfileProvider,
                                                EditProfileModel?>(
                                            selector: (context, provider) =>
                                                provider.editProfileModelObj,
                                            builder: (context,
                                                editProfileModelObj, child) {
                                              return CustomDropDown(
                                                  hasBorder: true,
                                                  hasContentPadding: true,
                                                  hintText: "lbl_20_5_2002".tr,
                                                  items: editProfileModelObj
                                                          ?.dropdownItemList ??
                                                      [],
                                                  onChanged: (value) {
                                                    context
                                                        .read<
                                                            EditProfileProvider>()
                                                        .onSelected(value);
                                                  });
                                            })
                                      ]))
                            ]))))),
            bottomNavigationBar: _buildUpdate(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 26.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 19.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_edit_profile".tr));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Selector<EditProfileProvider, TextEditingController?>(
        selector: (context, provider) => provider.fullNameController,
        builder: (context, fullNameController, child) {
          return CustomTextFormField(
              controller: fullNameController,
              hintText: "lbl_anna_alvarado".tr,
              hintStyle: CustomTextStyles.bodyMediumBluegray700,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 21.v, 13.h, 21.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEdit,
                      height: 17.adaptSize,
                      width: 17.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 60.v));
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<EditProfileProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_annaalvarado221_gmail_com".tr,
              hintStyle: CustomTextStyles.bodyMediumBluegray700,
              textInputType: TextInputType.emailAddress,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 21.v, 13.h, 21.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEdit,
                      height: 17.adaptSize,
                      width: 17.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 60.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Selector<EditProfileProvider, TextEditingController?>(
        selector: (context, provider) => provider.phoneNumberController,
        builder: (context, phoneNumberController, child) {
          return CustomTextFormField(
              controller: phoneNumberController,
              hintText: "lbl_01005239876".tr,
              hintStyle: CustomTextStyles.bodyMediumBluegray700,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 7.h, 18.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCircumedit,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 60.v),
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_update".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 30.v),
        buttonTextStyle: CustomTextStyles.headlineSmallWhiteA700,
        onPressed: () {
          onTapUpdate(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the studentProfileScreen when the action is triggered.
  onTapUpdate(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.studentProfileScreen,
    );
  }
}
