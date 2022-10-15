import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/get_all_customer_info_entity.dart';
import 'package:db_offline_flutter/domain/repositories/remote_customer_info_repository.dart';

class RemoteGetAllCustomerInfoUseCase {
  final RemoteCustomerInfoRepository repository;

  RemoteGetAllCustomerInfoUseCase(this.repository);

  Future<Either<Failure, List<GetAllCustomerInfoEntity>>> execute() {
    return repository.getAllCustomerInfo();
  }

}