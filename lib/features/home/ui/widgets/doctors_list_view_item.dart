import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/theming/text_styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12.0),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2023/12/21/06/23/doctor-8461303_1280.jpg',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
              ),
          ),
          horizontalSpace(16),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DR. Doctor Name', style: TextStyles.font14DarkBlueMedium,),
              Text('doctor specialist name', style: TextStyles.font13GreyRegular,),
              Text('01205193769', style: TextStyles.font13GreyRegular,),
            ],
          )
          )
        ],
      ),
    );
  }
}