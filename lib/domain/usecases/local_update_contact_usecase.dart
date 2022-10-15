import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/entities/contact_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalUpdateContactUseCase {
  final LocalContactRepository repository;

  LocalUpdateContactUseCase(this.repository);

  Future<Either<Failure, String>> execute(ContactEntity contactEntity) {
    return repository.updateContact(contactEntity);
  }

}