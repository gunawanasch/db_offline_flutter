import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalInsertCustomerInfoUseCase {
  final LocalCustomerInfoRepository repository;

  LocalInsertCustomerInfoUseCase(this.repository);

  Future<Either<Failure, String>> execute(CustomerInfoEntity customerInfoEntity) {
    return repository.insertCustomerInfo(customerInfoEntity);
  }

}