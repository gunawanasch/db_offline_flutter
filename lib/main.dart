import 'package:db_offline_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'library/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DB Offline",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: PrimaryColor,
          foregroundColor: White,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: PrimaryDarkColor,
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
