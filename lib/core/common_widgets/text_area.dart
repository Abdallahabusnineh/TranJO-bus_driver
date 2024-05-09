import 'package:bus_driver/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
class TextArea extends StatelessWidget {
  const TextArea({
    Key? key,

    ///-----[Controller]-----
    required this.controller,
    ///-----[Texts]-----
    this.hintText,
    this.hintTextStyle,

    ///-----[Enable_Borders]-----
    this.isFocusedWithBorder = true,
    this.isEnabledWithBorder = true,
    this.isFocusedErrorWithBorder = true,
    this.isErrorWithBorder = true,

    ///-----[Borders_Radius]-----
    this.enabledBorderRadius,
    this.focusedBorderRadius,
    this.focusedErrorBorderRadius,
    this.errorBorderRadius,

    ///-----[Text_Area]-----
    this.minLines,
    this.maxLines,

    ///-----[Colors]-----
    this.filled,
    this.filledColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,

    ///-----[Methods]-----
    this.onSaved,
    this.onChange,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
  }) : super(key: key);

  ///-----[Controller]-----
  final TextEditingController controller;

  ///-----[Texts]-----
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

  ///-----[Text_Area]-----
  final int? minLines;
  final int? maxLines;

  ///-----[Colors]-----
  final bool? filled;
  final Color? filledColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;

  ///-----[Methods]-----
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines ?? 7,
      maxLines: maxLines ?? 10,

      ///------------------------
      keyboardType: TextInputType.visiblePassword,

      ///------------------------
      controller: controller,

      ///------------------------
      onSaved: onSaved ?? (val) {},

      ///------------------------
      onChanged: onChange ?? (val) {},

      ///------------------------
      decoration: InputDecoration(
        ///------------------------
        hintText: hintText ?? "Write Something...",
        hintStyle: hintTextStyle ?? const TextStyle(),

        ///------------------------
        filled: filled ?? true,
        fillColor: filledColor ?? AppColors.myGrey,

        ///------------------------
        /// Todo: Maybe Later ...
        // prefixIcon: prefixIcon ??
        //     Icon(
        //       Icons.lock,
        //       color: prefixIconColor,
        //     ),

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
      ),
    );
  }
}
