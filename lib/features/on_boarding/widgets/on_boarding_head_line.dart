import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theming/text_styles.dart';

class OnBoardingHeadLine extends StatelessWidget {
  const OnBoardingHeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/logo.svg'),
        SizedBox(width: 10.w),
        Text('Docdoc', style: TextStyles.font24BlackBold),
      ],
    );
  }
}
