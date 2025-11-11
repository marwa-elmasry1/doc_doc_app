import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_project/core/networking/api_service.dart';
import 'package:new_project/core/networking/dio_factory.dart';
import 'package:new_project/features/login/data/repos/login_repo.dart';
import 'package:new_project/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio && Api
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
