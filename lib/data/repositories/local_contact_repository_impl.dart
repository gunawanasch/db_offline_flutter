import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/data/datasources/local_contact_data_source.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/domain/entities/contact_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalContactRepositoryImpl implements LocalContactRepository {
  final LocalContactDataSource dataSource;

  LocalContactRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<ContactEntity>>> getAllContact() async {
    final result = await dataSource.getAllContact();

    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<Either<Failure, String>> insertContact(ContactEntity contactEntity) async {
    try {
      final result =
      await dataSource.insertContact(ContactModel.fromEntity(contactEntity));

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(GlobalDataFailure(e.toString()));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> updateContact(ContactEntity contactEntity) async {
    try {
      final result =
          await dataSource.updateContact(ContactModel.fromEntity(contactEntity));

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(GlobalDataFailure(e.toString()));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> deleteContact(int idContact) async {
    try {
      final result =
          await dataSource.deleteContact(idContact);

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(GlobalDataFailure(e.toString()));
    } catch (e) {
      throw e;
    }
  }

}