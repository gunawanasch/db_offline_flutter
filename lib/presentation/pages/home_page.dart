import 'package:db_offline_flutter/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_page.dart';
import 'customer_info_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _styleButton = ElevatedButton.styleFrom(
      primary: PrimaryColor,
      minimumSize: const Size.fromHeight(50),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("DB Offline"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            const SizedBox(height: 100),
            ElevatedButton(
              style: _styleButton,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ContactPage();
                    }
                ));
              },
              child: const Text("CRUD"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: _styleButton,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CustomerInfoPage();
                    }
                ));
              },
              child: const Text("ONLINE TO OFFLINE"),
            ),
          ],
        ),
      )
    );
  }

}