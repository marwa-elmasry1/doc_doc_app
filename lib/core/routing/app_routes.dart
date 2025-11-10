import 'package:flutter/material.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/features/login/ui/login_screen.dart';
import 'package:new_project/features/on_boarding/on_boarding_screen.dart';
import 'package:new_project/features/splash/splash_screen.dart';

class AppRoutes{
  Route generateRoute(RouteSettings settings){
    // final dynamic arguments = settings.arguments;
    switch(settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (_) => const OnBoardingScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route Found For${settings.name}')),
          ),
        );
    }

  }
}