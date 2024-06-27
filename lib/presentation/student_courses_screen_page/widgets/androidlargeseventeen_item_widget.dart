import '../models/androidlargeseventeen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class AndroidlargeseventeenItemWidget extends StatelessWidget {
  AndroidlargeseventeenItemWidget(
    this.androidlargeseventeenItemModelObj, {
    Key? key,
    this.onTapImgUiUxdesign,
    this.onTapTxtUiUxDesign1,
    this.onTapTxtmohamedHesham,
  }) : super(
          key: key,
        );

  AndroidlargeseventeenItemModel androidlargeseventeenItemModelObj;

  VoidCallback? onTapImgUiUxdesign;

  VoidCallback? onTapTxtUiUxDesign1;

  VoidCallback? onTapTxtmohamedHesham;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: androidlargeseventeenItemModelObj?.uiUxdesign,
          height: 95.v,
          width: 127.h,
          radius: BorderRadius.circular(
            10.h,
          ),
          onTap: () {
            onTapImgUiUxdesign!.call();
          },
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 6.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 185.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Text(
                            androidlargeseventeenItemModelObj.uiUxDesign1!,
                            style: CustomTextStyles.titleSmallPoppins,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        GestureDetector(
                          child: Text(
                            androidlargeseventeenItemModelObj.mohamedHesham!,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgMdiFavouriteBorder,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(
                        top: 20.v,
                        bottom: 3.v,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
