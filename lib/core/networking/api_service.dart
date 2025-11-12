import 'package:dio/dio.dart';
import 'package:new_project/core/networking/api_constants.dart';
import 'package:new_project/features/login/data/models/login_request_body.dart';
import 'package:new_project/features/login/data/models/login_response_body.dart';
import 'package:new_project/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:new_project/features/sign_up/data/models/sign_up_response_body.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

 ///retrofit annotation
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  // i injected it into dio -> make api depends on dio
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignUpResponseBody> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );
}


 