import '../models/androidlargetwentyfive_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

// ignore: must_be_immutable
class AndroidlargetwentyfiveItemWidget extends StatelessWidget {
  AndroidlargetwentyfiveItemWidget(
    this.androidlargetwentyfiveItemModelObj, {
    Key? key,
    this.onTapImgUiUxdesign,
    this.onTapTxtMohamedHesham,
  }) : super(
          key: key,
        );

  AndroidlargetwentyfiveItemModel androidlargetwentyfiveItemModelObj;

  VoidCallback? onTapImgUiUxdesign;

  VoidCallback? onTapTxtMohamedHesham;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: androidlargetwentyfiveItemModelObj?.uiUxdesign,
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
          padding: EdgeInsets.only(
            left: 16.h,
            top: 2.v,
            bottom: 47.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                androidlargetwentyfiveItemModelObj.uiUxDesign1!,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 6.v),
              GestureDetector(
                onTap: () {
                  onTapTxtMohamedHesham!.call();
                },
                child: Text(
                  androidlargetwentyfiveItemModelObj.mohamedHesham!,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: androidlargetwentyfiveItemModelObj?.uiUxdesign2,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(
            top: 20.v,
            bottom: 51.v,
          ),
        ),
      ],
    );
  }
}
