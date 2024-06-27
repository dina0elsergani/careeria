import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.groupValue,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.gradient,
    this.backgroundColor,
  }) : super(
          key: key,
        );

  final BoxDecoration? decoration;
  final Alignment? alignment;
  final bool? isRightCheck;
  final double? iconSize;
  String? value;
  final String? groupValue;
  final Function(String) onChange;
  final String? text;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextAlign? textAlignment;
  final Gradient? gradient;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildRadioButtonWidget,
          )
        : buildRadioButtonWidget;
  }

  bool get isGradient => gradient != null;
  BoxDecoration get gradientDecoration => BoxDecoration(gradient: gradient);
  Widget get buildRadioButtonWidget => InkWell(
        onTap: () {
          onChange(value!);
        },
        child: Container(
          decoration: decoration ??
              BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.circular(10.h),
              ),
          width: width,
          padding: padding ?? EdgeInsets.all(8.0),
          child: (isRightCheck ?? false)
              ? rightSideRadioButton
              : leftSideRadioButton,
        ),
      );

  Widget get leftSideRadioButton => Row(
        children: [
          Padding(
            child: radioButtonWidget,
            padding: EdgeInsets.only(right: 8),
          ),
          Expanded(child: textWidget),
        ],
      );

  Widget get rightSideRadioButton => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: textWidget),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: radioButtonWidget,
          ),
        ],
      );

  Widget get textWidget => Text(
        text ?? "",
        overflow: TextOverflow.visible,
        softWrap: true,
        textAlign: textAlignment ?? TextAlign.center,
        style: textStyle ?? CustomTextStyles.bodyMediumRegular,
      );

  Widget get radioButtonWidget => SizedBox(
        height: iconSize ?? 24.h, // Increased height
        width: iconSize ?? 24.h,  // Increased width
        child: Radio<String>(
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          value: value ?? "",
          groupValue: groupValue,
          onChanged: (value) {
            onChange(value!);
          },
        ),
      );

  BoxDecoration get radioButtonDecoration =>
      BoxDecoration(color: backgroundColor);
}
