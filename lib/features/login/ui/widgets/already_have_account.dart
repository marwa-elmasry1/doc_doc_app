import 'package:flutter/material.dart';
import 'package:new_project/core/theming/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have am account? ',
            style: TextStyles.font13DarkBlueRegular
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13BlueSemiBold
          ),

        ]
      ));
  }
}