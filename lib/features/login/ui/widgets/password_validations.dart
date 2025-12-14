import 'package:flutter/material.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/core/theming/text_styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool hasMminLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.hasMminLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At Least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 Uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 special character', hasSpecialChar),
        verticalSpace(2),
        buildValidationRow('At Least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At Least 8 charecters log', hasMminLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: ColorManager.greyColor),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated
                ? ColorManager.greyColor
                : ColorManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
