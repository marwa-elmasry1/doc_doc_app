import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/helpers/extentions.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/core/theming/color_manager.dart';
import 'package:new_project/core/theming/text_styles.dart';
import 'package:new_project/features/login/logic/cubit/login_cubit.dart';
import 'package:new_project/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        // from freezed
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryColor,
                    ),
                  ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: Icon(Icons.error, color: ColorManager.redColor, size: 32),
            content: Text(error, style: TextStyles.font15DarkBlueMedium),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Got It', style: TextStyles.font14BlueSemiBold),
              ),
            ],
          ),
    );
  }
}
