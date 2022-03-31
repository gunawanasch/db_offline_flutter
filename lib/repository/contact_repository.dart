import 'package:db_offline_flutter/database/dao/contact_dao.dart';
import 'package:db_offline_flutter/model/contact_model.dart';

class ContactRepository {
  final contactDao = ContactDao();

  Future getAllContact() => contactDao.getAllContact();

  Future insertContact(ContactModel contactModel) => contactDao.insertContact(contactModel);

  Future updateContact(ContactModel contactModel) => contactDao.updateContact(contactModel);

  Future deleteContact(int idContact) => contactDao.deleteContact(idContact);

}