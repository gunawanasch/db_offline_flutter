import 'package:db_offline_flutter/data/models/contact_model.dart';

abstract class LocalContactRepository {
  Future<List<ContactModel>> getAllContact();

  Future<ContactModel> insertContact(ContactModel contactModel);

  Future<int> updateContact(ContactModel contactModel);

  Future<int> deleteContact(int idContact);
}