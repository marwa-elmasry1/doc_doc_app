import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/theming/text_styles.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Image.asset('assets/images/home_blue_pattern.png', fit: BoxFit.cover),
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage('assets/images/home_blue_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18whiteMedium,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(4),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Find Nearby',
                    style: TextStyles.font13BlueRegular,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            child: Image.asset('assets/images/doctor_image.png', height: 200.h),
          ),
        ],
      ),
    );
  }
}
