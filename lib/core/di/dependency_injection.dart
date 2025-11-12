import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_project/core/networking/api_service.dart';
import 'package:new_project/core/networking/dio_factory.dart';
import 'package:new_project/features/login/data/repos/login_repo.dart';
import 'package:new_project/features/login/logic/cubit/login_cubit.dart';
import 'package:new_project/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:new_project/features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio && Api
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt())); //singltone => make it just once
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt())); //factory => creat it every single time i need it

  //signUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
