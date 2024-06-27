import '../models/androidlargesix_item_model.dart';
import 'package:flutter/material.dart';
import 'package:careeria/core/app_export.dart';

class AndroidlargesixItemWidget extends StatelessWidget {
  final AndroidlargesixItemModel model;
  final Function(String) onTap;

  AndroidlargesixItemWidget({Key? key, required this.model, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(model.ellipse ?? ""), // Ensure non-null by providing a default
      child: Container(
        width: 70.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue), // Simplified for the example
          borderRadius: BorderRadius.circular(35.h),
        ),
        child: Image.asset(model.ellipse ?? 'default_image_path'), // Default path if null
      ),
    );
  }
}
