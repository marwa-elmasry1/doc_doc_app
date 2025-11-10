import 'package:flutter/material.dart';
import 'package:new_project/core/theming/text_styles.dart';


class TermAndConditionsText extends StatelessWidget {
  const TermAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging you are agree to our ',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(text: 'Terms & Conditions ',
           style: TextStyles.font13DarkBlueMedium),
          TextSpan(text: 'and ',
           style: TextStyles.font13GreyRegular.copyWith(height: 1.5)),
          TextSpan(text: 'Privacy Policy',
           style: TextStyles.font13DarkBlueMedium.copyWith(height: 1.5)),
        ],
      ),
    );
  }
}