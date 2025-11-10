import 'package:flutter/material.dart';
import 'package:new_project/core/helpers/spacing.dart';
import 'package:new_project/core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObSecured = true;


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
            },
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
          ),
          verticalSpace(24),
         
        ],
      ),
    );
  }

}
