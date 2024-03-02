import 'package:careeria/core/utils/validation_functions.dart';
import 'package:careeria/widgets/custom_text_form_field.dart';
import 'package:careeria/widgets/custom_outlined_button.dart';
import 'models/signup_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/signup_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignupProvider(), child: SignupScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.splashScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 28.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        Text("lbl_sign_up".tr,
                            style: theme.textTheme.displaySmall),
                        Text("msg_lets_get_you_signed".tr,
                            style: CustomTextStyles.headlineSmallMedium),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 91.v),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.roundedBorder15,
                                image: DecorationImage(
                                    image: fs.Svg(ImageConstant.imgSignUp),
                                    fit: BoxFit.cover)),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildFirstName1(context),
                                  SizedBox(height: 25.v),
                                  _buildEmail(context),
                                  SizedBox(height: 25.v),
                                  _buildPassword(context),
                                  SizedBox(height: 25.v),
                                  _buildConfirmpassword(context),
                                  SizedBox(height: 25.v),
                                  _buildSignUP(context),
                                  SizedBox(height: 25.v),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtAlreadyhavean(context);
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "msg_already_have_an2".tr,
                                                style: CustomTextStyles
                                                    .titleMediumffffffff),
                                            TextSpan(text: " "),
                                            TextSpan(
                                                text: "lbl_log_in".tr,
                                                style: CustomTextStyles
                                                    .titleMediumff5093b8)
                                          ]),
                                          textAlign: TextAlign.left)),
                                  SizedBox(height: 60.v)
                                ]))
                      ])))
                    ])))));
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Selector<SignupProvider, TextEditingController?>(
                selector: (context, provider) => provider.firstNameController,
                builder: (context, firstNameController, child) {
                  return CustomTextFormField(
                      controller: firstNameController,
                      hintText: "lbl_first_name".tr,
                      validator: (value) {
                        if (!isText(value)) {
                          return "err_msg_please_enter_valid_text".tr;
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 13.h, vertical: 18.v),
                      borderDecoration: TextFormFieldStyleHelper.outlinePrimary,
                      fillColor: appTheme.whiteA700);
                })));
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Selector<SignupProvider, TextEditingController?>(
                selector: (context, provider) => provider.lastNameController,
                builder: (context, lastNameController, child) {
                  return CustomTextFormField(
                      controller: lastNameController,
                      hintText: "lbl_last_name".tr,
                      validator: (value) {
                        if (!isText(value)) {
                          return "err_msg_please_enter_valid_text".tr;
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 17.h, vertical: 18.v),
                      borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                      fillColor: appTheme.whiteA700);
                })));
  }

  /// Section Widget
  Widget _buildFirstName1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildFirstName(context), _buildLastName(context)]);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_email".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL10,
              fillColor: appTheme.whiteA700);
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
        selector: (context, provider) => provider.passwordController,
        builder: (context, passwordController, child) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
              borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
              fillColor: appTheme.whiteA700);
        });
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
        selector: (context, provider) => provider.confirmpasswordController,
        builder: (context, confirmpasswordController, child) {
          return CustomTextFormField(
              controller: confirmpasswordController,
              hintText: "msg_confirm_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.h, vertical: 18.v),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimary,
              fillColor: appTheme.whiteA700);
        });
  }

  /// Section Widget
  Widget _buildSignUP(BuildContext context) {
    return CustomOutlinedButton(
        text: "lbl_sign_up2".tr,
        buttonStyle: CustomButtonStyles.outlinePrimary,
        onPressed: () {
          onTapSignUP(context);
        });
  }

  onTapSignUP(BuildContext context) {
    // TODO: implement Actions
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
