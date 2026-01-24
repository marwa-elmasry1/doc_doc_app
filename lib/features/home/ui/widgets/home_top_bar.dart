import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/core/theming/text_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Marwa!', style: TextStyles.font18DarkBlueBold),
            Text('How Are you Today?', style: TextStyles.font11GreyRegular),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorManager.moreLighterGreyColor,
          child: SvgPicture.asset(
            'assets/svgs/notifications.svg',
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
