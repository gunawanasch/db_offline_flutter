import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalInsertContactUseCase implements UseCase<ContactModel, ContactModel?> {
  final LocalContactRepository _localContactRepository;

  LocalInsertContactUseCase(this._localContactRepository);

  @override
  Future<ContactModel> call({ContactModel? params}) {
    return _localContactRepository.insertContact(params!);
  }

}