import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/di/dependency_injection.dart';
import 'package:new_project/core/routing/app_routes.dart';
import 'doc_app.dart';
void main() async{
  setUpGetIt();
  // just to fix texts being hidden bug in ScreenUtil in realese run
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRoutes(),));
}
