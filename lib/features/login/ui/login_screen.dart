import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/theming/text_styles.dart';
import 'package:new_project/core/widgets/app_text_button.dart';
import 'package:new_project/features/login/logic/cubit/login_cubit.dart';
import 'package:new_project/features/login/ui/widgets/dont_have_account.dart';
import 'package:new_project/features/login/ui/widgets/email_and_password.dart';
import 'package:new_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:new_project/features/login/ui/widgets/terms_and_condtions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                     EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forget Password',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        validateThenLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccount(),
                     LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
if (context.read<LoginCubit>().formKey.currentState!.validate()) {
  context.read<LoginCubit>().emitLoginStates();
}

// even i use controller in ui use this code blew
  //   if (context.read<LoginCubit>().formKey.currentState!.validate()) {
  //     context.read<LoginCubit>().emitLoginStates(
  //       LoginRequestBody(
  //         context.read<LoginCubit>().emailEditingController.text,
  //         context.read<LoginCubit>().passwordEditingController.text,
  //       ),
  //     );
  //   }
  }
}
