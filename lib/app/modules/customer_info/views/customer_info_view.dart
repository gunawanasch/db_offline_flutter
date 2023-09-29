import 'package:db_offline_flutter/model/customer_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/customer_info_controller.dart';

class CustomerInfoView extends GetView<CustomerInfoController> {
  const CustomerInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Info"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() =>
          controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.message.isEmpty
            ? ListView.builder(
                itemCount: controller.listCustomerInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerInfoRow(customerInfoModel: controller.listCustomerInfo[index]);
                }
              )
            : Center(child: Text(controller.message))
        ),
      ),
    );
  }
}

class CustomerInfoRow extends StatelessWidget {
  CustomerInfoRow({Key? key, required this.customerInfoModel}) : super(key: key);
  final CustomerInfoModel customerInfoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerInfoModel.name!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        customerInfoModel.phone!,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}