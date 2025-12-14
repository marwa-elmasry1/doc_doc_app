import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/core/theming/text_styles.dart';

class AppTextButton extends StatelessWidget {
final String buttonText;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonWidth;
  final double? buttonHight;
  final TextStyle? buttonTextStyle;
  final double? borderRadius;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    required this.buttonText,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonWidth,
    this.buttonHight,
    this.buttonTextStyle,
    this.borderRadius,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? ColorManager.primaryColor,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 16.0),
          ),
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 12.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHight ?? 50.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: buttonTextStyle ?? TextStyles.font16WhiteSemi,
      ),
    );
  }
}