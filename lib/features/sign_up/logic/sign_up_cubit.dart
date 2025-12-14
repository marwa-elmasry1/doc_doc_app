import 'package:flutter/widgets.dart';
import 'package:new_project/core/networking/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:new_project/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:new_project/features/sign_up/logic/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUP(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 1,
      ),
    );
    response.when(
      success: (signUpResponseBody) {
        emit(SignUpState.success(signUpResponseBody));
      },
      failure: (error) {
        emit(SignUpState.error(error: error.apiErrorModel.message ?? " "));
      },
    );
  }
}
