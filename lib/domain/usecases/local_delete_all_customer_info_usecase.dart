import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalDeleteAllCustomerInfoUseCase implements UseCase<int, void> {
  final LocalCustomerInfoRepository _localCustomerInfoRepository;

  LocalDeleteAllCustomerInfoUseCase(this._localCustomerInfoRepository);

  @override
  Future<int> call({void params}) {
    return _localCustomerInfoRepository.deleteAllCustomerInfo();
  }

}