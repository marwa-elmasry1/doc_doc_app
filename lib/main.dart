import 'package:flutter/material.dart';
import 'package:new_project/core/di/dependency_injection.dart';
import 'package:new_project/core/routing/app_routes.dart';
import 'doc_app.dart';
void main() {
  setUpGetIt();
  runApp(DocApp(appRouter: AppRoutes(),));
}
