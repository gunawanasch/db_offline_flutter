import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/data/datasources/remote_customer_info_data_source.dart';
import 'package:db_offline_flutter/domain/entities/get_all_customer_info_entity.dart';
import 'package:db_offline_flutter/domain/repositories/remote_customer_info_repository.dart';
import 'package:dio/dio.dart';

class RemoteCustomerInfoRepositoryImpl implements RemoteCustomerInfoRepository {
  final RemoteCustomerInfoDataSource dataSource;

  RemoteCustomerInfoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<GetAllCustomerInfoEntity>>> getAllCustomerInfo() async {
    try {
      final result = await dataSource.getAllCustomerInfo();
      if (result.status == 1) {
        return Right(result.dataGetAllCustomerInfo!.map((model) => model.toEntity()).toList());
      } else {
        return Left(GlobalDataFailure(result.message ?? ''));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(GlobalDataFailure(e.response?.statusMessage ?? ''));
      } else {
        return const Left(GlobalDataFailure('Something wrong'));
      }
    }
  }

}