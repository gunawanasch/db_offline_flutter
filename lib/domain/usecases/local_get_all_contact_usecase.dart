import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/contact_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalGetAllContactUseCase {
  final LocalContactRepository repository;

  LocalGetAllContactUseCase(this.repository);

  Future<Either<Failure, List<ContactEntity>>> execute() {
    return repository.getAllContact();
  }

}