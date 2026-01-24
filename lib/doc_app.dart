import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/core/routing/routes.dart';
import 'package:new_project/core/theming/color_manager.dart';

import 'core/routing/app_routes.dart';
class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});
  final AppRoutes appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: ColorManager.primaryColor,
          scaffoldBackgroundColor: ColorManager.white,
        ),
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
