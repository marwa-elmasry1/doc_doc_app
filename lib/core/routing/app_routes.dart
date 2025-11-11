import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/di/dependency_injection.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/features/home/ui/home_screen.dart';
import 'package:new_project/features/login/logic/cubit/login_cubit.dart';
import 'package:new_project/features/login/ui/login_screen.dart';
import 'package:new_project/features/on_boarding/on_boarding_screen.dart';
import 'package:new_project/features/splash/splash_screen.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    // final dynamic arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('No Route Found For${settings.name}')),
              ),
        );
    }
  }
}
