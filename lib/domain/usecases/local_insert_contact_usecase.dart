import 'package:dartz/dartz.dart';
import 'package:db_offline_flutter/core/failure.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/domain/entities/contact_entity.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalInsertContactUseCase {
  final LocalContactRepository repository;

  LocalInsertContactUseCase(this.repository);
  
  Future<Either<Failure, String>> execute(ContactEntity contactEntity) {
    return repository.insertContact(contactEntity);
  }

}