import 'widgets/frameeightyfour_item_widget.dart';
import 'models/frameeightyfour_item_model.dart';
import 'models/student_home_screen_model.dart';
import 'widgets/description_item_widget.dart';
import 'models/description_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/student_home_screen_provider.dart';

class StudentHomeScreenPage extends StatefulWidget {
  const StudentHomeScreenPage({Key? key}) : super(key: key);

  @override
  StudentHomeScreenPageState createState() => StudentHomeScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StudentHomeScreenProvider(),
        child: StudentHomeScreenPage());
  }
}

class StudentHomeScreenPageState extends State<StudentHomeScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Column(children: [
                  SizedBox(height: 22.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    _buildArrowLeft(context),
                    SizedBox(height: 15.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 22.h),
                            child: Text("lbl_recently_videos".tr,
                                style:
                                    CustomTextStyles.titleLargePrimaryBold))),
                    SizedBox(height: 13.v),
                    _buildFrameEightyFour(context),
                    SizedBox(height: 22.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 22.h),
                            child: Text("lbl_latest_news".tr,
                                style:
                                    CustomTextStyles.titleLargePrimaryBold))),
                    SizedBox(height: 20.v),
                    _buildDescription(context),
                    SizedBox(height: 16.v),
                    _buildDescription1(context)
                  ])))
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 21.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 20.v,
                  width: 10.h,
                  margin: EdgeInsets.only(bottom: 57.v),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  }),
              CustomImageView(
                  imagePath: ImageConstant.imgEllipse1265x66,
                  height: 65.v,
                  width: 66.h,
                  radius: BorderRadius.circular(33.h),
                  margin: EdgeInsets.only(left: 12.h, top: 10.v, bottom: 2.v),
                  onTap: () {
                    onTapImgCircleImage(context);
                  }),
              Padding(
                  padding: EdgeInsets.only(left: 19.h, top: 18.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtAnnaAlvarado(context);
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(top: 4.v),
                                      child: Text("lbl_anna_alvarado".tr,
                                          style:
                                              CustomTextStyles.titleSmall15))),
                              CustomImageView(
                                  imagePath: ImageConstant.imgBxsEdit,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin: EdgeInsets.only(bottom: 2.v),
                                  onTap: () {
                                    onTapImgBxsEdit(context);
                                  })
                            ]),
                        SizedBox(height: 14.v),
                        Text("msg_annaalvarado221_gmail_com".tr,
                            style:
                                CustomTextStyles.bodyMediumBeVietnamBluegray900)
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildFrameEightyFour(BuildContext context) {
    return SizedBox(
        height: 205.v,
        child: Consumer<StudentHomeScreenProvider>(
            builder: (context, provider, child) {
          return ListView.separated(
              padding: EdgeInsets.only(left: 16.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                    width: 221.0.h,
                    child: Divider(
                        height: 2.v,
                        thickness: 2.v,
                        color: theme.colorScheme.primary,
                        indent: 11.0.h,
                        endIndent: 11.0.h));
              },
              itemCount: provider
                  .studentHomeScreenModelObj.frameeightyfourItemList.length,
              itemBuilder: (context, index) {
                FrameeightyfourItemModel model = provider
                    .studentHomeScreenModelObj.frameeightyfourItemList[index];
                return FrameeightyfourItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: Consumer<StudentHomeScreenProvider>(
              builder: (context, provider, child) {
            return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 1.v);
                },
                itemCount: provider
                    .studentHomeScreenModelObj.descriptionItemList.length,
                itemBuilder: (context, index) {
                  DescriptionItemModel model = provider
                      .studentHomeScreenModelObj.descriptionItemList[index];
                  return DescriptionItemWidget(model);
                });
          })),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicWidth(
                  child: _buildFiftySeven(context,
                      description: "msg_garage_struggle".tr)))
        ]));
  }

  /// Section Widget
  Widget _buildDescription1(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 17.h),
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: _buildFiftySeven(context,
                  description: "msg_garage_struggle".tr)),
          Padding(
              padding: EdgeInsets.only(left: 19.h),
              child: _buildFiftySeven(context,
                  description: "msg_garage_struggle".tr))
        ])));
  }

  /// Common widget
  Widget _buildFiftySeven(
    BuildContext context, {
    required String description,
  }) {
    return Container(
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgRectangle2395x199,
                  height: 95.v,
                  width: 199.h,
                  radius: BorderRadius.vertical(top: Radius.circular(10.h))),
              SizedBox(height: 8.v),
              Container(
                  width: 175.h,
                  margin: EdgeInsets.only(left: 6.h),
                  child: Text(description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge!
                          .copyWith(color: appTheme.black900))),
              SizedBox(height: 59.v)
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the studentProfileScreen when the action is triggered.
  onTapImgCircleImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.studentProfileScreen,
    );
  }

  /// Navigates to the studentProfileScreen when the action is triggered.
  onTapTxtAnnaAlvarado(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.studentProfileScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapImgBxsEdit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
