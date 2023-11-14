import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Trade Brain',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
// HM76H03Y5JRCWJIB
