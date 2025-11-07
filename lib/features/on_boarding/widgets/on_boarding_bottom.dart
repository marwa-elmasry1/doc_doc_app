import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/core/theming/text_styles.dart';
import 'package:new_project/core/widgets/app_text_button.dart';

class OnBoardingBottom extends StatelessWidget {
  const OnBoardingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            style: TextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(30),
           AppTextButton(buttonText: 'Get Started',
               onPressed: ()=> Navigator.pushNamed(context, Routes.loginScreen))
        ],
      ),
    );
  }
}
