import '../models/androidlargesix_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class AndroidlargesixItemWidget extends StatelessWidget {
  AndroidlargesixItemWidget(
    this.androidlargesixItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AndroidlargesixItemModel androidlargesixItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomImageView(
          imagePath: androidlargesixItemModelObj?.ellipse,
          height: 70.adaptSize,
          width: 70.adaptSize,
          radius: BorderRadius.circular(
            35.h,
          ),
        ),
      ),
    );
  }
}
