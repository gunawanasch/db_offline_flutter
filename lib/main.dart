import 'package:db_offline_flutter/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'library/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomePage(),
    );
  }
}
