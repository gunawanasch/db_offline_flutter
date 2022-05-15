import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalInsertCustomerInfoUseCase implements UseCase<CustomerInfoModel, CustomerInfoModel?> {
  final LocalCustomerInfoRepository _localCustomerInfoRepository;

  LocalInsertCustomerInfoUseCase(this._localCustomerInfoRepository);

  @override
  Future<CustomerInfoModel> call({CustomerInfoModel? params}) {
    return _localCustomerInfoRepository.insertCustomerInfo(params!);
  }

}