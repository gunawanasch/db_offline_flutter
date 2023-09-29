import 'package:db_offline_flutter/app/routes/app_pages.dart';
import 'package:db_offline_flutter/library/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle _styleButton = ElevatedButton.styleFrom(
      backgroundColor: PrimaryColor,
      minimumSize: const Size.fromHeight(50),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("DB Offline"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            const SizedBox(height: 100),
            ElevatedButton(
              style: _styleButton,
              onPressed: () {
                Get.toNamed(Routes.CONTACT);
              },
              child: const Text("CRUD"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: _styleButton,
              onPressed: () {
                Get.toNamed(Routes.CUSTOMER_INFO);
              },
              child: const Text("ONLINE TO OFFLINE"),
            ),
          ],
        ),
      )
    );
  }
}
