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
          ClipRRect(  // Added ClipRRect for rounded corners on the image
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.h)), // Match container's border radius
            child: SizedBox(
              height: 95.v,
              width: 199.h,
              child: Image.network(
                frameeightyfourItemModelObj.videoImage as String,
                fit: BoxFit.cover, // This will cover the area without distorting the aspect ratio
                width: 199.h, // Ensuring the image fills the width
                height: 95.v, // Ensuring the image fills the height
              ),
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
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      frameeightyfourItemModelObj.videoName!,
                      style: CustomTextStyles.titleLargePrimaryMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          SizedBox(height: 13.v),
        ],
      ),
    );
  }
}
