import 'package:bus_driver/core/utils/app_colors.dart';
import 'package:bus_driver/core/utils/regex.dart';
import 'package:flutter/material.dart';
class PasswordWithShowButton extends StatelessWidget {
  const PasswordWithShowButton(
      {Key? key,

      ///-----[Controller]-----
      required this.controller,

      ///-----[Texts]-----
      this.withLabel = false,
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
      this.filled,
      this.filledColor,
      this.suffixIconColor,
      this.focusedBorderColor,
      this.enabledBorderColor,
      this.errorBorderColor,
      this.focusedErrorBorderColor,

      ///-----[Methods]-----
      this.onSaved,
      this.onChange,
      this.validator,
      this.enabledBorder,
      this.focusedBorder,
      this.suffixPressed,
      this.focusedErrorBorder,
      this.errorBorder,
      this.suffixShowPassIcon,
      this.suffixHidePassIcon,
      required this.bloc})
      : super(key: key);

  ///-----[Controller]-----
  final TextEditingController controller;

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
  final Color? suffixIconColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;

  ///-----[Methods]-----
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final void Function()? suffixPressed;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final Widget? suffixShowPassIcon;
  final Widget? suffixHidePassIcon;
  final dynamic bloc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      ///------------------------
      obscureText: bloc.hiddenPassword,

      ///------------------------
      keyboardType: TextInputType.visiblePassword,

      ///------------------------
      controller: controller,

      ///------------------------
      onSaved: onSaved ?? (val) {},

      ///------------------------
      onChanged: onChange ?? (val) {},

      ///------------------------
      validator: validator ??
          (val) {
            if (isValidPassword(val!)) {
              return null;
            } else if (val.isEmpty) {
              return "Password must not be empty";
            } else {
              return "the password must contain 1 upper case \n, 1 lower case,1 character and number, and length must above 8";
            }
          },

      ///------------------------
      decoration: withLabel!
          ? customInputDecorationWithLabel(bloc)
          : customInputDecorationWithoutLabel(bloc),
    );
  }

  InputDecoration customInputDecorationWithLabel(dynamic bloc) =>
      InputDecoration(
        ///------------------------
        filled: filled ?? true,
        fillColor: filledColor ?? AppColors.myGrey,

        ///------------------------
        suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: bloc.hiddenPassword
                ? suffixHidePassIcon ??
                    Icon(
                      Icons.remove_red_eye,
                      color: suffixIconColor,
                    )
                : suffixShowPassIcon ??
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: suffixIconColor,
                    )),

        ///------------------------
        label: Text(label ?? "password"),
        labelStyle: const TextStyle(),
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

  InputDecoration customInputDecorationWithoutLabel(dynamic bloc) =>
      InputDecoration(
        ///------------------------
        filled: filled ?? true,
        fillColor: filledColor ?? AppColors.myGrey,

        ///------------------------
        suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: bloc.hiddenPassword
                ? suffixHidePassIcon ??
                    Icon(
                      Icons.remove_red_eye,
                      color: suffixIconColor,
                    )
                : suffixShowPassIcon ??
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: suffixIconColor,
                    )),

        ///------------------------
        hintText: hintText ?? "password",
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
