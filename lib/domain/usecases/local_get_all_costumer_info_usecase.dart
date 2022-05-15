import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalGetAllCustomerInfoUseCase implements UseCase<List<CustomerInfoModel>, void> {
  final LocalCustomerInfoRepository _localCustomerInfoRepository;

  LocalGetAllCustomerInfoUseCase(this._localCustomerInfoRepository);

  @override
  Future<List<CustomerInfoModel>> call({void params}) {
    return _localCustomerInfoRepository.getAllCustomerInfo();
  }

}