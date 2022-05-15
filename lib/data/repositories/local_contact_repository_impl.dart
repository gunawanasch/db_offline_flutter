import 'package:db_offline_flutter/data/data_sources/local/dao/contact_dao.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalContactRepositoryImpl implements LocalContactRepository {
  final ContactDao _contactDao;

  const LocalContactRepositoryImpl(this._contactDao);

  @override
  Future<List<ContactModel>> getAllContact() {
    return _contactDao.getAllContact();
  }

  @override
  Future<ContactModel> insertContact(ContactModel contactModel) {
    return _contactDao.insertContact(contactModel);
  }

  @override
  Future<int> updateContact(ContactModel contactModel) {
    return _contactDao.updateContact(contactModel);
  }

  @override
  Future<int> deleteContact(int idContact) {
    return _contactDao.deleteContact(idContact);
  }


}