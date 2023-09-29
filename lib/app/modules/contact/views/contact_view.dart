import 'package:db_offline_flutter/library/colors.dart';
import 'package:db_offline_flutter/model/contact_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);

  final InputDecoration _decoration = const InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: PrimaryDarkColor),
    ),
  );

  openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Warning"),
        content: const Text("Please complete all field."),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.message.isEmpty
              ? ListView.builder(
                  itemCount: controller.listContactModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ContactRow(
                      contactModel: controller.listContactModel[index],
                      onPopupMenuSelected: (selectedMenuItem, model) {
                        if (selectedMenuItem == 0) {
                          controller.nameController.text    = controller.listContactModel[index].name ?? "";
                          controller.phoneController.text   = controller.listContactModel[index].phone ?? "";
                          controller.addressController.text = controller.listContactModel[index].address ?? "";
                          showFormContactBottomSheet(isAdd: false, idContact: controller.listContactModel[index].idContact ?? 0);
                        } else {
                          controller.deleteContact(
                              controller.listContactModel[index].idContact!);
                        }
                      },
                    );
                  })
              : Center(child: Text(controller.message))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormContactBottomSheet(isAdd: true);
        },
        backgroundColor: PrimaryDarkColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showFormContactBottomSheet({required bool isAdd, int? idContact}) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          height: 350.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name"),
                TextField(
                  decoration: _decoration,
                  controller: controller.nameController,
                ),
                const SizedBox(height: 20),
                const Text("Phone"),
                TextField(
                  decoration: _decoration,
                  controller: controller.phoneController,
                ),
                const SizedBox(height: 20),
                const Text("Address"),
                TextField(
                  decoration: _decoration,
                  controller: controller.addressController,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (controller.nameController.text.trim().isEmpty || controller.phoneController.text.trim().isEmpty || controller.addressController.text.trim().isEmpty) {
                      openDialog();
                    } else {
                      Get.back();
                      if (isAdd) {
                        controller.addContact();
                      } else {
                        controller.updateContact(idContact ?? 0);
                      }
                    }
                  },
                  child: const Text("SAVE"),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ContactRow extends StatefulWidget {
  const ContactRow(
      {Key? key, required this.contactModel, required this.onPopupMenuSelected})
      : super(key: key);
  final ContactModel contactModel;
  final Function(int, ContactModel) onPopupMenuSelected;

  @override
  State<ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  Future _showPopupMenu(BuildContext context, TapDownDetails details) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),
      items: [
        const PopupMenuItem(
          child: Text("Edit"),
          value: 0,
        ),
        const PopupMenuItem(
          child: Text("Delete"),
          value: 1,
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      widget.onPopupMenuSelected(value!, widget.contactModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contactModel.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.contactModel.phone!,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.contactModel.address!,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )),
            GestureDetector(
              onTapDown: (details) => _showPopupMenu(context, details),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/ic_three_dots.png",
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
