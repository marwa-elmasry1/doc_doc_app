import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/features/on_boarding/widgets/doctor_image_and_text.dart';
import 'package:new_project/features/on_boarding/widgets/on_boarding_bottom.dart';
import 'package:new_project/features/on_boarding/widgets/on_boarding_head_line.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h ,bottom: 30.h,),
          child: Column(
            children: [
              const OnBoardingHeadLine(),
              verticalSpace(30),
              const DoctorImageAndText(),
              const OnBoardingBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
