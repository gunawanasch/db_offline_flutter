import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/data/datasources/local_customer_info_data_source.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_customer_info_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalCustomerInfoRepositoryImpl implements LocalCustomerInfoRepository {
  final LocalCustomerInfoDataSource dataSource;

  LocalCustomerInfoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CustomerInfoEntity>>> getAllCustomerInfo() async {
    final result = await dataSource.getAllCustomerInfo();

    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<Either<Failure, String>> insertCustomerInfo(CustomerInfoEntity customerInfoEntity) async {
    try {
      final result =
      await dataSource.insertCustomerInfo(CustomerInfoModel.fromEntity(customerInfoEntity));

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(GlobalDataFailure(e.toString()));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> deleteAllCustomerInfo() async {
    try {
      final result =
      await dataSource.deleteAllCustomerInfo();

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(GlobalDataFailure(e.toString()));
    } catch (e) {
      throw e;
    }
  }

}