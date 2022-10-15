import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/contact_entity.dart';

abstract class LocalContactRepository {
  Future<Either<Failure, List<ContactEntity>>> getAllContact();
  Future<Either<Failure, String>> insertContact(ContactEntity contactEntity);
  Future<Either<Failure, String>> updateContact(ContactEntity contactEntity);
  Future<Either<Failure, String>> deleteContact(int idContact);
}