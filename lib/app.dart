import 'package:evamp_task_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/k_styles.dart';

class EvampApp extends StatelessWidget {
  const EvampApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'Evamp Task',
      locale: Get.deviceLocale,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: KStyle.lightTheme,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
