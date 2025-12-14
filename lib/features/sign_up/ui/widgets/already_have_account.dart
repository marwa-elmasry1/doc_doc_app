import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/helpers/extentions.dart';
import 'package:new_project/core/routing/routes.dart';
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
            text: 'Already have an account? ',
            style: TextStyles.font13DarkBlueRegular
          ),
          TextSpan(
            text: 'Login',
            style: TextStyles.font13BlueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
          ),
          
        ],
      ));
  }
}