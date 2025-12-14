import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/helpers/extentions.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/core/theming/text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementNamed(Routes.signUpScreen);
                  },
          ),
        ],
      ),
    );
  }
}
