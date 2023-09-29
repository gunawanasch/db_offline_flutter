import 'package:db_offline_flutter/model/contact_model.dart';
import 'package:db_offline_flutter/repository/contact_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  late ContactRepository contactRepository  = ContactRepository();
  List<ContactModel> listContactModel       = [];
  var isLoading                             = false.obs;
  var message                               = "";
  var nameController                        = TextEditingController();
  var phoneController                       = TextEditingController();
  var addressController                     = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllcontact();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllcontact() async {
    isLoading.value   = true;
    listContactModel  = await contactRepository.getAllContact();
    isLoading.value   = false;
  }

  addContact() async {
    isLoading.value         = true;
    var contactModel        = ContactModel();
    contactModel.name       = nameController.text;
    contactModel.phone      = phoneController.text;
    contactModel.address    = addressController.text;
    await contactRepository.insertContact(contactModel);
    nameController.text     = "";
    phoneController.text    = "";
    addressController.text  = "";
    listContactModel        = [];
    getAllcontact();
  }

  updateContact(int idContact) async {
    isLoading.value         = true;
    var contactModel        = ContactModel();
    contactModel.idContact  = idContact;
    contactModel.name       = nameController.text;
    contactModel.phone      = phoneController.text;
    contactModel.address    = addressController.text;
    await contactRepository.updateContact(contactModel);
    nameController.text     = "";
    phoneController.text    = "";
    addressController.text  = "";
    listContactModel        = [];
    getAllcontact();
  }

  deleteContact(int idContact) async {
    isLoading.value = true;
    await contactRepository.deleteContact(idContact);
    listContactModel = [];
    getAllcontact();
    isLoading.value = false;
  }

}
