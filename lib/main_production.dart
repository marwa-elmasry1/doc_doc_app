import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/core/di/dependency_injection.dart';
import 'package:new_project/core/routing/app_routes.dart';
import 'doc_app.dart';
void main() {
  setUpGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: const Color.fromARGB(255, 7, 181, 255),
      statusBarColor: const Color.fromARGB(255, 126, 171, 128)
    )
  );
  runApp(DocApp(appRouter: AppRoutes(),));
}
