import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/helpers/app_rejex.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/widgets/app_text_form_field.dart';
import 'package:new_project/features/login/logic/cubit/login_cubit.dart';
import 'package:new_project/features/login/ui/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObSecured = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMminLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordEditingController;
    setupPasswordControllerListner();
  }

  void setupPasswordControllerListner() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasMminLength = AppRegex.hasMinLength(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailEditingController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Password',
            isObSecured: isObSecured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObSecured = !isObSecured;
                });
              },
              child: Icon(
                isObSecured ? Icons.visibility_off : Icons.visibility_sharp,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              }
            },
            controller: context.read<LoginCubit>().passwordEditingController,
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialChar: hasSpecialChar,
            hasNumber: hasNumber,
            hasMminLength: hasMminLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
