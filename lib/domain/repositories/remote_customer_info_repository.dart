import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/get_all_customer_info_entity.dart';

abstract class RemoteCustomerInfoRepository {
  Future<Either<Failure, List<GetAllCustomerInfoEntity>>> getAllCustomerInfo();
}