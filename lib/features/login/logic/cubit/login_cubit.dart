import 'package:flutter/widgets.dart';
import 'package:new_project/core/networking/api_result.dart';
import 'package:new_project/features/login/data/models/login_request_body.dart';
import 'package:new_project/features/login/data/repos/login_repo.dart';
import 'package:new_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponseBody) {
        emit(LoginState.success(loginResponseBody));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? " "));
      },
    );
  }
}
