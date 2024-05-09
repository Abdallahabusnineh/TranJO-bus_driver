
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';




class CustomTextButtons extends StatelessWidget {
  const CustomTextButtons(
      {Key? key,
      required this.onPressed,
      this.text,
      this.backgroundColor,
      this.elevation,
      this.minSize,
      this.foregroundColor,
      this.visualDensity,
      this.borderRadius,
      this.textStyle,
      this.child,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.padding})
      : super(key: key);

  final void Function() onPressed;
  final String? text;
  final Color? backgroundColor;
  final double? elevation;
  final Size? minSize;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;
  final VisualDensity? visualDensity;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation ?? 0,
        minimumSize: minSize,
        padding: padding,
        foregroundColor: foregroundColor ?? Colors.black,
        visualDensity: visualDensity ?? VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
      ),
      child: child ??
          Text(
            text ?? "Skip",
            style: TextStyle(
                color: textColor ?? Colors.blue,
                fontWeight: fontWeight ?? FontWeight.normal,
                fontSize: fontSize ?? 12.sp),
          ),
    );
  }
}
