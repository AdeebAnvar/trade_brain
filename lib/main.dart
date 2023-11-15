import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/data/models/local_models/watchlist_model.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<WatchListModel>(
      WatchListModelAdapter()); // Register the adapter

  HttpOverrides.global = MyHttpOverrides();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Watchlist',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
