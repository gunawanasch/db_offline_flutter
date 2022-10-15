import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalDeleteContactUseCase {
  final LocalContactRepository repository;

  LocalDeleteContactUseCase(this.repository);

  Future<Either<Failure, String>> execute(int idContact) {
    return repository.deleteContact(idContact);
  }

}