import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/data/models/get_all_customer_info_model.dart';
import 'package:db_offline_flutter/domain/repositories/remote_customer_info_repository.dart';

class RemoteGetAllCustomerInfoUseCase implements UseCase<GetAllCustomerInfoModel, void> {
  final RemoteCustomerInfoRepository _remoteCustomerInfoRepository;

  RemoteGetAllCustomerInfoUseCase(this._remoteCustomerInfoRepository);

  @override
  Future<GetAllCustomerInfoModel> call({void params}) {
    return _remoteCustomerInfoRepository.getAllCustomerInfo();
  }

}