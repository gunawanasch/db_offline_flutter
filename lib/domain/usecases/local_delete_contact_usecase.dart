import 'package:db_offline_flutter/core/usecase/usecase.dart';
import 'package:db_offline_flutter/domain/repositories/local_contact_repository.dart';

class LocalDeleteContactUseCase implements UseCase<int, int> {
  final LocalContactRepository _localContactRepository;

  LocalDeleteContactUseCase(this._localContactRepository);

  @override
  Future<int> call({int? params}) {
    return _localContactRepository.deleteContact(params!);
  }

}