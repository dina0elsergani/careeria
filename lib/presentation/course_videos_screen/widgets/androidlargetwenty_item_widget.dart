import '../models/androidlargetwenty_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class AndroidlargetwentyItemWidget extends StatelessWidget {
  AndroidlargetwentyItemWidget(
    this.androidlargetwentyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AndroidlargetwentyItemModel androidlargetwentyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 95.v,
          width: 127.h,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomImageView(
                imagePath: androidlargetwentyItemModelObj?.image,
                height: 95.v,
                width: 127.h,
                radius: BorderRadius.circular(
                  10.h,
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10.h,
                    right: 103.h,
                    bottom: 3.v,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  decoration: AppDecoration.fillBlack9001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder1,
                  ),
                  child: Text(
                    androidlargetwentyItemModelObj.fiveThousand!,
                    style: CustomTextStyles.poppinsWhiteA700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24.h,
            top: 15.v,
            bottom: 41.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                androidlargetwentyItemModelObj.uiUxDesign!,
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(height: 7.v),
              Text(
                androidlargetwentyItemModelObj.brianSusan!,
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
