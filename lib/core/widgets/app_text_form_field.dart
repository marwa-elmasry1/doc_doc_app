import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/core/theming/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusBorder;
  final InputBorder? enableBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextInputType? textInputType;
  final String hintText;
  final bool? isObSecured;
  final Widget? suffixIcon;
  final Color? backgoundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusBorder,
    this.enableBorder,
    this.inputTextStyle,
    this.hintTextStyle,
    required this.hintText,
    this.isObSecured,
    this.suffixIcon,
    this.textInputType,
    this.backgoundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        enabledBorder:
            enableBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.lighterGreyColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.6),
            ),
        focusedBorder:
            focusBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.6),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.redColor, width: 1.3),
          borderRadius: BorderRadius.circular(16.6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.redColor, width: 1.3),
          borderRadius: BorderRadius.circular(16.6),
        ),
        hintStyle: hintTextStyle ?? TextStyles.font14MediumGreyRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgoundColor ?? ColorManager.moreLighterGreyColor,
        filled: true,
      ),
      obscureText: isObSecured ?? false,
      style: TextStyles.font14DarkBlueMedium,
      keyboardType: textInputType ?? TextInputType.text,
      cursorColor: ColorManager.primaryColor,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
