import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/custom_text_form_field.dart';
import 'widgets/androidlargeseventeen_item_widget.dart';
import 'models/androidlargeseventeen_item_model.dart';
import 'models/student_courses_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/student_courses_screen_provider.dart';

class StudentCoursesScreenPage extends StatefulWidget {
  const StudentCoursesScreenPage({Key? key}) : super(key: key);

  @override
  StudentCoursesScreenPageState createState() =>
      StudentCoursesScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StudentCoursesScreenProvider(),
        child: StudentCoursesScreenPage());
  }
}

class StudentCoursesScreenPageState extends State<StudentCoursesScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 31.v),
                  Padding(
                      padding: EdgeInsets.only(left: 24.h),
                      child: Selector<StudentCoursesScreenProvider,
                              TextEditingController?>(
                          selector: (context, provider) =>
                              provider.coursesController,
                          builder: (context, coursesController, child) {
                            return CustomTextFormField(
                                width: 67.h,
                                controller: coursesController,
                                hintText: "lbl_courses".tr,
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.centerLeft,
                                borderDecoration:
                                    TextFormFieldStyleHelper.underLinePrimary,
                                filled: false);
                          })),
                  Divider(color: theme.colorScheme.onPrimaryContainer),
                  SizedBox(height: 20.v),
                  _buildAndroidLargeSeventeen(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 19.h, top: 18.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_resources".tr));
  }

  /// Section Widget
  Widget _buildAndroidLargeSeventeen(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Consumer<StudentCoursesScreenProvider>(
                builder: (context, provider, child) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 23.v);
                  },
                  itemCount: provider.studentCoursesScreenModelObj
                      .androidlargeseventeenItemList.length,
                  itemBuilder: (context, index) {
                    AndroidlargeseventeenItemModel model = provider
                        .studentCoursesScreenModelObj
                        .androidlargeseventeenItemList[index];
                    return AndroidlargeseventeenItemWidget(model,
                        onTapImgUiUxdesign: () {
                      onTapImgUiUxdesign(context);
                    }, onTapTxtUiUxDesign1: () {
                      onTapTxtUiUxDesign1(context);
                    }, onTapTxtMohamedHesham: () {
                      onTapTxtMohamedHesham(context);
                    });
                  });
            })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the courseViewScreen when the action is triggered.
  onTapImgUiUxdesign(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.courseViewScreen,
    );
  }

  /// Navigates to the courseViewScreen when the action is triggered.
  onTapTxtUiUxDesign1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.courseViewScreen,
    );
  }

  onTapTxtMohamedHesham(BuildContext context) {
    // TODO: implement Actions
  }
}
