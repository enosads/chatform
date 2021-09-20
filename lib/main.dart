import 'package:chatform/shared/routes/app_pages.dart';
import 'package:chatform/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shared/bindings/app_binding.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.home,
      initialBinding: AppBinding(),
    ),
  );
}
