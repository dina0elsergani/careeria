import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/androidlargetwentyfive_item_widget.dart';
import 'models/androidlargetwentyfive_item_model.dart';
import 'models/favourite_courses_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';
import 'provider/favourite_courses_screen_provider.dart';

class FavouriteCoursesScreenPage extends StatefulWidget {
  const FavouriteCoursesScreenPage({Key? key}) : super(key: key);

  @override
  FavouriteCoursesScreenPageState createState() =>
      FavouriteCoursesScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavouriteCoursesScreenProvider(),
        child: FavouriteCoursesScreenPage());
  }
}

class FavouriteCoursesScreenPageState
    extends State<FavouriteCoursesScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Column(
              children: [
                SizedBox(height: 20.v),
                Divider(color: theme.colorScheme.onPrimaryContainer),
                SizedBox(height: 20.v),
                Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h),
                    child: Consumer<FavouriteCoursesScreenProvider>(
                        builder: (context, provider, child) {
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 40.v);
                          },
                          itemCount: provider.favouriteCoursesScreenModelObj
                              .androidlargetwentyfiveItemList.length,
                          itemBuilder: (context, index) {
                            AndroidlargetwentyfiveItemModel model = provider
                                .favouriteCoursesScreenModelObj
                                .androidlargetwentyfiveItemList[index];
                            return AndroidlargetwentyfiveItemWidget(model,
                                onTapImgUiUxdesign: () {
                              onTapImgUiUxdesign(context);
                            }, onTapTxtMohamedHesham: () {
                              onTapTxtMohamedHesham(context);
                            });
                          });
                    })),
              ],
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 34.h,
        // leading: AppbarLeadingImage(
        //     imagePath: ImageConstant.imgArrowLeft,
        //     margin: EdgeInsets.only(left: 24.h, top: 19.v, bottom: 16.v),
        //     onTap: () {
        //       onTapArrowLeft(context);
        //     }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_favourite".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapImgUiUxdesign(BuildContext context) {
    // TODO: implement Actions
  }

  onTapTxtMohamedHesham(BuildContext context) {
    // TODO: implement Actions
  }
}
