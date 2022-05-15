import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalGetAllContactUseCase implements UseCase<List<ContactModel>, void> {
  final LocalContactRepository _localContactRepository;

  LocalGetAllContactUseCase(this._localContactRepository);

  @override
  Future<List<ContactModel>> call({void params}) {
    return _localContactRepository.getAllContact();
  }

}