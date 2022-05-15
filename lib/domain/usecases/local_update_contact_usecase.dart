import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalUpdateContactUseCase implements UseCase<int, ContactModel?> {
  final LocalContactRepository _localContactRepository;

  LocalUpdateContactUseCase(this._localContactRepository);

  @override
  Future<int> call({ContactModel? params}) {
    return _localContactRepository.updateContact(params!);
  }

}