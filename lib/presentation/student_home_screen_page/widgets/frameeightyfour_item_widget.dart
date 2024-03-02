import '../models/frameeightyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class FrameeightyfourItemWidget extends StatelessWidget {
  FrameeightyfourItemWidget(
    this.frameeightyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FrameeightyfourItemModel frameeightyfourItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      width: 199.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 95.v,
            width: 199.h,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle23,
                  height: 95.v,
                  width: 199.h,
                  radius: BorderRadius.vertical(
                    top: Radius.circular(10.h),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10.h,
                      right: 175.h,
                      bottom: 3.v,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    decoration: AppDecoration.fillBlack9001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder1,
                    ),
                    child: Text(
                      frameeightyfourItemModelObj.fiveThousand!,
                      style: CustomTextStyles.poppinsWhiteA700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          SizedBox(
            height: 60.v,
            width: 199.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: frameeightyfourItemModelObj?.mohamedHesham,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 1.v),
                        Text(
                          frameeightyfourItemModelObj.mohamedHesham1!,
                          style: CustomTextStyles.bodyMediumBeVietnamGray600,
                        ),
                        SizedBox(height: 8.v),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      frameeightyfourItemModelObj.uIUXDesign!,
                      style: CustomTextStyles.titleLargePrimaryMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              frameeightyfourItemModelObj.complete!,
              style: CustomTextStyles.bodySmallGreen600_1,
            ),
          ),
          SizedBox(height: 13.v),
        ],
      ),
    );
  }
}
