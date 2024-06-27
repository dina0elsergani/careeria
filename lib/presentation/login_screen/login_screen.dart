import 'package:careeria/core/utils/validation_functions.dart';
import 'package:careeria/main.dart';
import 'package:careeria/widgets/custom_text_form_field.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/login_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/login_provider.dart';
import 'package:careeria/domain/googleauth/google_auth_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login(String email, String password, BuildContext context) async {
    final url = Uri.parse('${apiUrl}/api/v1/auth/login');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      var responseData = json.decode(response.body);
      if (response.statusCode == 200 ) {
        print('Login successful: ${responseData['message']}');
        isLoggedIn = true;
        userName = responseData['userName']??''; // Set user's name from the response
        userEmail = email;
        userId = responseData['userId'].toString(); 
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', isLoggedIn);
        await prefs.setString('userEmail', userEmail!);
        await prefs.setString('userName', userName!);
        await prefs.setString('userId', userId!);
        NavigatorService.pushNamed(
          AppRoutes.androidLargeTwentythreeContainerScreen,
        );
      } else {
        print('Failed to login: Status code: ${response.statusCode}, Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred during login: $e');
    }
  }

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
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(children: [
                              SizedBox(height: 32.v),
                              Text("lbl_login2".tr,
                                  style: theme.textTheme.displaySmall),
                              Text("msg_lets_get_you_logged".tr,
                                  style: CustomTextStyles.headlineSmallMedium),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.h, vertical: 25.v),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder15,
                                      image: DecorationImage(
                                          image:
                                              fs.Svg(ImageConstant.imgGroup76),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 75.v),
                                        _buildEmail(context),
                                        SizedBox(height: 24.v),
                                        _buildPassword(context),
                                        SizedBox(height: 24.v),
                                        _buildLogin(context),
                                        SizedBox(height: 18.v),
                                        Text("lbl_or".tr,
                                            style: CustomTextStyles
                                                .headlineSmallWhiteA700Medium),
                                        SizedBox(height: 15.v),
                                        _buildContinueWithLinkedln(context),
                                        SizedBox(height: 18.v),
                                        _buildContinueWithMobileNumber(context),
                                        SizedBox(height: 18.v),
                                        _buildContinueWithGoogle(context),
                                        SizedBox(height: 19.v),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtDonthaveanaccount(
                                                  context);
                                            },
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "msg_don_t_have_an_account2"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .titleMediumffffffff),
                                                  TextSpan(text: " "),
                                                  TextSpan(
                                                      text: "lbl_sign_up".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumff5093b8)
                                                ]),
                                                textAlign: TextAlign.left))
                                      ]))
                            ])))))));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<LoginProvider, TextEditingController?>(
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
                  EdgeInsets.symmetric(horizontal: 19.h, vertical: 18.v),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimary,
              fillColor: appTheme.whiteA700);
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Selector<LoginProvider, TextEditingController?>(
        selector: (context, provider) => provider.passwordController,
        builder: (context, passwordController, child) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 19.h, vertical: 18.v),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL102,
              fillColor: appTheme.gray100);
        });
  }

  /// Section Widget
  Widget _buildLogin(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_login2".tr,
        buttonTextStyle: CustomTextStyles.headlineSmallWhiteA700Medium,
        onPressed: () {
          onTapLogin(context);
        });
  }

  /// Section Widget
  Widget _buildContinueWithLinkedln(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_continue_with_linkedln".tr,
        rightIcon: Container(
            margin: EdgeInsets.only(left: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLinkedinlogo,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonTextStyle: theme.textTheme.bodyLarge!);
  }

  /// Section Widget
  Widget _buildContinueWithMobileNumber(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_continue_with_mobile".tr,
        rightIcon: Container(
            margin: EdgeInsets.only(left: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgCallWhiteA700,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonTextStyle: theme.textTheme.bodyLarge!);
  }

  /// Section Widget
  Widget _buildContinueWithGoogle(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_continue_with_google".tr,
        rightIcon: Container(
            margin: EdgeInsets.only(left: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogle,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonTextStyle: theme.textTheme.bodyLarge!,
        onPressed: () {
          onTapContinueWithGoogle(context);
        });
  }

  /// Navigates to the androidLargeTwentythreeContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) {
      if (_formKey.currentState!.validate()) {
      final provider = Provider.of<LoginProvider>(context, listen: false); // Access provider
        login(
          provider.emailController.text,
          provider.passwordController.text,
          context
        );
      }
  }

  onTapContinueWithGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
