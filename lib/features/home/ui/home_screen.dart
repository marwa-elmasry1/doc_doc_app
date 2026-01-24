import 'package:flutter/material.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:new_project/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:new_project/features/home/ui/widgets/doctor_speciality_row.dart';
import 'package:new_project/features/home/ui/widgets/doctors_list_view.dart';
import 'package:new_project/features/home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              verticalSpace(16),
              DoctorSpecialityRow(),
              verticalSpace(16),
              const DoctorSpecialityListView(),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}