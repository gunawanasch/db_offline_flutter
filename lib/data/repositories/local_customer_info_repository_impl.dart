import 'package:db_offline_flutter/data/data_sources/local/dao/customer_info_dao.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalCustomerInfoRepositoryImpl implements LocalCustomerInfoRepository {
  final CustomerInfoDao _customerInfoDao;

  const LocalCustomerInfoRepositoryImpl(this._customerInfoDao);

  @override
  Future<List<CustomerInfoModel>> getAllCustomerInfo() {
    return _customerInfoDao.getAllCustomerInfo();
  }

  @override
  Future<CustomerInfoModel> insertCustomerInfo(CustomerInfoModel customerInfoModel) {
    return _customerInfoDao.insertContact(customerInfoModel);
  }

  @override
  Future<int> deleteAllCustomerInfo() {
    return _customerInfoDao.deleteAllCustomerInfo();
  }

}