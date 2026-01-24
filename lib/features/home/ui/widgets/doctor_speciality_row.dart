import 'package:flutter/material.dart';
import 'package:new_project/core/theming/text_styles.dart';

class DoctorSpecialityRow extends StatelessWidget {
  const DoctorSpecialityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors Speciality',
          style: TextStyles.font18DarkBlueBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font13BlueRegular,
        ),
      ],
    );
  }
}