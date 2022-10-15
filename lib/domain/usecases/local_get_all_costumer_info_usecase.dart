import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';

class LocalGetAllCustomerInfoUseCase {
  final LocalCustomerInfoRepository repository;

  LocalGetAllCustomerInfoUseCase(this.repository);

  Future<Either<Failure, List<CustomerInfoEntity>>> execute() {
    return repository.getAllCustomerInfo();
  }

}