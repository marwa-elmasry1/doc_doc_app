import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/theming/text_styles.dart';
import 'package:new_project/core/widgets/app_text_button.dart';
import 'package:new_project/features/login/ui/widgets/terms_and_condtions_text.dart';
import 'package:new_project/features/sign_up/logic/sign_up_cubit.dart';
import 'package:new_project/features/sign_up/ui/widgets/already_have_account.dart';
import 'package:new_project/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:new_project/features/sign_up/ui/widgets/user_data_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. w\'re excited to welcome you to our community ',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(15),
                Column(
                  children: [
                    UserDataForm(),

                    verticalSpace(20),
                    AppTextButton(
                      buttonText: 'Create Account',
                      onPressed: () {
                        validateThenLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermAndConditionsText(),
                    verticalSpace(25),
                    AlreadyHaveAccount(),
                    SignUpBlocListener(),
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
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpState();
    }
  }
}
