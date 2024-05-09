
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActionButtonWithIcon extends StatelessWidget {
  const ActionButtonWithIcon(
      {Key? key,
      this.text,
      required this.icon,
      this.labelWidget,
      this.height,
      this.width,
      this.borderRadius,
      this.foregroundColor,
      this.visualDensity,
      this.verticalPadding,
      this.horizontalPadding,
      this.backgroundColor,
      this.elevation,
      this.shadowColor,
      required this.onPressed,
      this.fontSize,
      this.fontWight,
      this.textColor,
      this.makeItOutline = false,
      this.withBorder = false,
      this.borderColor,
      this.borderWidth})
      : super(key: key);
  final void Function() onPressed;
  final String? text;
  final Widget icon;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? foregroundColor;
  final VisualDensity? visualDensity;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final double? fontSize;
  final FontWeight? fontWight;
  final Color? textColor;
  final bool? makeItOutline;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? labelWidget;
  final bool? withBorder;

  @override
  Widget build(BuildContext context) {
    if (makeItOutline == false) {
      return ElevatedButton.icon(
        label: labelWidget ??
            Text(
              text ?? "Search",
              style: TextStyle(
                  fontSize: fontSize ?? 12.sp,
                  fontWeight: fontWight ?? FontWeight.normal,
                  color: textColor ?? Colors.white),
            ),
        onPressed: onPressed,
        icon: icon,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 80.w, height ?? 6.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
            side: withBorderOrNot(),
          ),
          foregroundColor: foregroundColor ?? Colors.white,
          visualDensity: visualDensity ?? VisualDensity.comfortable,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 4.w,
              vertical: verticalPadding ?? 1.h),
          backgroundColor: backgroundColor ?? Colors.red,
          elevation: elevation ?? 0,
          shadowColor: shadowColor ?? Colors.red,
        ),
      );
    } else {
      return ElevatedButton.icon(
        label: labelWidget ??
            Text(
              text ?? "Search",
              style: TextStyle(
                  fontSize: fontSize ?? 12.sp,
                  fontWeight: fontWight ?? FontWeight.normal,
                  color: textColor ?? Colors.red),
            ),
        onPressed: onPressed,
        icon: icon,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 80.w, height ?? 6.5.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              side: withBorderOrNot()),
          foregroundColor: foregroundColor ?? Colors.white,
          visualDensity: visualDensity ?? VisualDensity.comfortable,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 4.w,
              vertical: verticalPadding ?? 1.h),
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation ?? 0,
          shadowColor: shadowColor ?? Colors.red,
        ),
      );
    }
  }

  BorderSide withBorderOrNot() {
    if (withBorder!) {
      return BorderSide(
          color: borderColor ?? Colors.black, width: borderWidth ?? 2);
    } else {
      return const BorderSide(style: BorderStyle.none);
    }
  }
}
