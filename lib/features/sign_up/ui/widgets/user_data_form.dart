import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/helpers/app_rejex.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/widgets/app_text_form_field.dart';
import 'package:new_project/features/login/ui/widgets/password_validations.dart';
import 'package:new_project/features/sign_up/logic/sign_up_cubit.dart';

class UserDataForm extends StatefulWidget {
  const UserDataForm({super.key});

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  bool isObSecured = true;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMminLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
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

  void setupPasswordConfirmationControllerListner() {
    passwordConfirmationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            textInputType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(9),
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
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(9),
          AppTextFormField(
            hintText: 'phone',
            textInputType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(9),
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
            controller: context.read<SignUpCubit>().passwordController,
          ),
          verticalSpace(9),
          AppTextFormField(
            hintText: 'Password confirmation',
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
              if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().passwordConfirmationController,
          ),
          verticalSpace(10),
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
    passwordConfirmationController.dispose();
    super.dispose();
  }
}
