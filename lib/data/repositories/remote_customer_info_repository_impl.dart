import 'package:db_offline_flutter/data/data_sources/remote/provider/customer_info_provider.dart';
import 'package:db_offline_flutter/data/models/get_all_customer_info_model.dart';
import 'package:db_offline_flutter/domain/repositories/remote_customer_info_repository.dart';

class RemoteCustomerInfoRepositoryImpl implements RemoteCustomerInfoRepository {
  final CustomerInfoProvider _customerInfoProvider;

  const RemoteCustomerInfoRepositoryImpl(this._customerInfoProvider);

  @override
  Future<GetAllCustomerInfoModel> getAllCustomerInfo() {
    return _customerInfoProvider.getAllCustomerInfo();
  }

}