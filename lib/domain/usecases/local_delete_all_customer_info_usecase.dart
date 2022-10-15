import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalDeleteAllCustomerInfoUseCase {
  final LocalCustomerInfoRepository repository;

  LocalDeleteAllCustomerInfoUseCase(this.repository);

  Future<Either<Failure, String>> execute() {
    return repository.deleteAllCustomerInfo();
  }

}