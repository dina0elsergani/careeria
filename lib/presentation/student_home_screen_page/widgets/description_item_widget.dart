import '../models/description_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class DescriptionItemWidget extends StatelessWidget {
  DescriptionItemWidget(
    this.descriptionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DescriptionItemModel descriptionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle2395x199,
            height: 95.v,
            width: 199.h,
            radius: BorderRadius.vertical(
              top: Radius.circular(10.h),
            ),
          ),
          SizedBox(height: 8.v),
          Container(
            width: 175.h,
            margin: EdgeInsets.only(left: 6.h),
            child: Text(
              "msg_garage_struggle".tr,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }
}
