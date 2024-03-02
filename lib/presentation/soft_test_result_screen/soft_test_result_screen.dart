import 'models/soft_test_result_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/soft_test_result_provider.dart';

class SoftTestResultScreen extends StatefulWidget {
  const SoftTestResultScreen({Key? key}) : super(key: key);

  @override
  SoftTestResultScreenState createState() => SoftTestResultScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SoftTestResultProvider(),
        child: SoftTestResultScreen());
  }
}

class SoftTestResultScreenState extends State<SoftTestResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.teal100,
            body: SizedBox(
                width: 300.h,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgBusinessCoachExplains,
                          height: 190.v,
                          width: 300.h),
                      SizedBox(height: 12.v),
                      Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Text("msg_you_have_weaknesses".tr,
                              style: CustomTextStyles.titleLargeBold)),
                      SizedBox(height: 29.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 2.v),
                                child: Text("lbl_12".tr,
                                    style: theme.textTheme.titleLarge)),
                            Padding(
                                padding: EdgeInsets.only(left: 3.h, top: 2.v),
                                child: Text("msg_presentation_skills2".tr,
                                    style: theme.textTheme.titleLarge))
                          ])),
                      SizedBox(height: 17.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 2.v),
                                child: Text("lbl_22".tr,
                                    style: theme.textTheme.titleLarge)),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 2.v),
                                child: Text("msg_leadership_skills2".tr,
                                    style: theme.textTheme.titleLarge))
                          ])),
                      SizedBox(height: 17.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h, right: 42.h),
                          child: Row(children: [
                            Text("lbl_32".tr,
                                style: theme.textTheme.titleLarge),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("msg_communication_skills".tr,
                                    style: theme.textTheme.titleLarge))
                          ])),
                      SizedBox(height: 30.v),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtToshowtherood2(context);
                              },
                              child: Container(
                                  width: 272.h,
                                  margin:
                                      EdgeInsets.only(left: 15.h, right: 12.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_to_show_the_rood3".tr,
                                            style: CustomTextStyles
                                                .titleLargeffffffff),
                                        TextSpan(
                                            text: "lbl_here".tr,
                                            style: CustomTextStyles
                                                .titleLargeff5093b8)
                                      ]),
                                      textAlign: TextAlign.center)))),
                      SizedBox(height: 5.v)
                    ]))));
  }

  onTapTxtToshowtherood2(BuildContext context) {
    // TODO: implement Actions
  }
}
