import '../models/androidlargetwentyfour_item_model.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class AndroidlargetwentyfourItemWidget extends StatelessWidget {
  AndroidlargetwentyfourItemWidget(
    this.androidlargetwentyfourItemModelObj, {
    Key? key,
    this.onTapStart,
  }) : super(
          key: key,
        );

  AndroidlargetwentyfourItemModel androidlargetwentyfourItemModelObj;

  VoidCallback? onTapStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.fillIndigo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.v,
            width: 41.h,
            margin: EdgeInsets.symmetric(vertical: 12.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50.v,
                    width: 41.h,
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadius.circular(
                        25.h,
                      ),
                      border: Border.all(
                        color: appTheme.black900,
                        width: 1.h,
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: androidlargetwentyfourItemModelObj?.image,
                  height: 30.v,
                  width: 25.h,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 2.h,
                top: 11.v,
              ),
              child: Column(
                children: [
                  Text(
                    androidlargetwentyfourItemModelObj.introductionTo!,
                    style: CustomTextStyles.titleSmallPoppins,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 9.h,
                      right: 3.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              androidlargetwentyfourItemModelObj.time!,
                              style: CustomTextStyles.bodyMediumBlack900,
                            ),
                            SizedBox(height: 3.v),
                            Row(
                              children: [
                                Container(
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(bottom: 4.v),
                                  padding: EdgeInsets.all(1.h),
                                  decoration:
                                      AppDecoration.fillPrimary1.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder7,
                                  ),
                                  child: CustomImageView(
                                    imagePath:
                                        androidlargetwentyfourItemModelObj
                                            ?.image1,
                                    height: 13.adaptSize,
                                    width: 13.adaptSize,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text(
                                    androidlargetwentyfourItemModelObj
                                        .completed!,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        _buildStart(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStart(BuildContext context) {
    return CustomElevatedButton(
      height: 34.v,
      width: 85.h,
      text: "lbl_start".tr,
      margin: EdgeInsets.symmetric(vertical: 4.v),
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium,
      onPressed: () {
        onTapStart!.call();
      },
    );
  }
}
