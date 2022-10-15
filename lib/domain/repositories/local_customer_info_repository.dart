import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';

abstract class LocalCustomerInfoRepository {
  Future<Either<Failure, List<CustomerInfoEntity>>> getAllCustomerInfo();
  Future<Either<Failure, String>> insertCustomerInfo(CustomerInfoEntity customerInfoEntity);
  Future<Either<Failure, String>> deleteAllCustomerInfo();
}