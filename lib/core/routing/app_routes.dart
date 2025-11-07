import 'package:flutter/material.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/features/on_boarding/on_boarding_screen.dart';

class AppRoutes{
  Route generateRoute(RouteSettings settings){
    // final dynamic arguments = settings.arguments;
    switch(settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (_) => const OnBoardingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route Found For${settings.name}')),
          ),
        );
    }

  }
}