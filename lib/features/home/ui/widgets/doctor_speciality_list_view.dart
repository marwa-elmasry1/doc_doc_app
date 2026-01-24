import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/core/theming/text_styles.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemBuilder: (context, index){
          return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 :  24),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.lightblue,
            child: SvgPicture.asset('assets/svgs/general_specialist.svg',
            width: 25.0,
            height: 25.0,
            ),
          ),
          Text('General',style: TextStyles.font12GreyRegular,),
        ],
      ),
    );
        },
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        ),
    );
  }
}

// class DoctorSpecialityListViewItem extends StatelessWidget {
//   const DoctorSpecialityListViewItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(start: index == 0 ? 0 :  24),
//       child: Column(
//         children: [
//           CircleAvatar(
//             backgroundColor: ColorManager.lightblue,
//             child: SvgPicture.asset('assets/svgs/general_specialist.svg',
//             width: 20.0,
//             height: 20.0,
//             ),
//           ),
//           Text('General',style: TextStyles.font13BlueRegular,),
//         ],
//       ),
//     );
//   }
// }