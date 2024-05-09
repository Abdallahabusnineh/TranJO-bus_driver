
import 'package:bus_driver/core/utils/app_colors.dart';
import 'package:bus_driver/core/utils/regex.dart';
import 'package:flutter/material.dart';

class EmailWithoutIcon extends StatelessWidget {
  const EmailWithoutIcon({
    Key? key,

    ///-----[Controller]-----
    required this.controller,
    this.enabled = true,

    ///-----[Texts]-----
    this.withLabel= false,
    this.label,
    this.labelStyle,
    this.hintText,
    this.hintTextStyle,

    ///-----[Enable_Borders]-----
    this.isFocusedWithBorder = false,
    this.isEnabledWithBorder = false,
    this.isFocusedErrorWithBorder = false,
    this.isErrorWithBorder = false,

    ///-----[Borders_Radius]-----
    this.enabledBorderRadius,
    this.focusedBorderRadius,
    this.focusedErrorBorderRadius,
    this.errorBorderRadius,

    ///-----[Colors]-----
    this.filled = true,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.filledColor,

    this.enabledBorderColor,
    this.focusedBorderColor,

    ///-----[Methods]-----
    this.onSaved,
    this.onChange,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,

  }) : super(key: key);

  ///-----[Controller]-----
  final TextEditingController controller;
  final bool enabled;

  ///-----[Texts]-----
  final bool? withLabel;
  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;

  ///-----[Enable_Borders]-----
  final bool? isFocusedWithBorder;
  final bool? isEnabledWithBorder;
  final bool? isFocusedErrorWithBorder;
  final bool? isErrorWithBorder;

  ///-----[Borders_Radius]-----
  final double? enabledBorderRadius;
  final double? focusedBorderRadius;
  final double? focusedErrorBorderRadius;
  final double? errorBorderRadius;

  ///-----[Colors]-----
  final bool? filled;
  final Color? filledColor;

  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;

  ///-----[Methods]-----
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      enabled: enabled,
      controller: controller,
      onSaved: onSaved ?? (val) {},
      onChanged: onChange ?? (val) {},
      validator:validator?? (val) {
        if(isValidEmail(val!)){
          return null;
        }else if(val.isEmpty){
          return "email must not be empty";
        }
        return null;
      },
      decoration: withLabel! ?customInputDecorationWithLabel():customInputDecorationWithOutLabel(),
    );
  }

  InputDecoration customInputDecorationWithLabel()=>InputDecoration(
    ///------------------------
    filled: filled ?? true,
    fillColor: filledColor,

    ///------------------------
    label: Text(label ?? "Email"),
    labelStyle: labelStyle ?? const TextStyle(),
    hintText: hintText ?? "",
    hintStyle: hintTextStyle ?? const TextStyle(),

    ///------------------------
    enabledBorder: enabledBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.grey,
            style:
            isEnabledWithBorder! ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(enabledBorderRadius ?? 10),
        ),

    ///------------------------
    focusedBorder: focusedBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.blue,
            style:
            isFocusedWithBorder! ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(focusedBorderRadius ?? 20),
        ),

    ///------------------------
    focusedErrorBorder: focusedErrorBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedErrorBorderColor ?? Colors.red,
            style: isFocusedErrorWithBorder!
                ? BorderStyle.solid
                : BorderStyle.none,
          ),
          borderRadius:
          BorderRadius.circular(focusedErrorBorderRadius ?? 20),
        ),

    ///------------------------
    errorBorder: errorBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: errorBorderColor ?? Colors.red,
            style:
            isErrorWithBorder! ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(errorBorderRadius ?? 20),
        ),
  );
  InputDecoration customInputDecorationWithOutLabel()=>InputDecoration(
    ///------------------------
    filled: filled ?? true,
    fillColor: filledColor ?? AppColors.myGrey,

    ///------------------------
    hintText: hintText ?? "Email",
    hintStyle: hintTextStyle ?? const TextStyle(),

    ///------------------------
    enabledBorder: enabledBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.grey,
            style:
            isEnabledWithBorder! ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(enabledBorderRadius ?? 10),
        ),

    ///------------------------
    focusedBorder: focusedBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.blue,
            style:
            isFocusedWithBorder! ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(focusedBorderRadius ?? 20),
        ),

    ///------------------------
    focusedErrorBorder: focusedErrorBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedErrorBorderColor ?? Colors.red,
            style: isFocusedErrorWithBorder!
                ? BorderStyle.solid
                : BorderStyle.none,
          ),
          borderRadius:
          BorderRadius.circular(focusedErrorBorderRadius ?? 20),
        ),

    ///------------------------
    errorBorder: errorBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: errorBorderColor ?? Colors.red,
            style:
            isErrorWithBorder! ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(errorBorderRadius ?? 20),
        ),
  );
}
