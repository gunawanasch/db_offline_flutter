import 'package:db_offline_flutter/domain/usecases/local_delete_contact_usecase.dart';
import 'package:db_offline_flutter/domain/usecases/local_get_all_contact_usecase.dart';
import 'package:db_offline_flutter/domain/usecases/local_insert_contact_usecase.dart';
import 'package:db_offline_flutter/domain/usecases/local_update_contact_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final LocalGetAllContactUseCase _localGetAllContactUseCase;
  final LocalInsertContactUseCase _localInsertContactUseCase;
  final LocalUpdateContactUseCase _localUpdateContactUseCase;
  final LocalDeleteContactUseCase _localDeleteContactUseCase;

  // ContactBloc(
  //     this._localGetAllContactUseCase,
  //     this._localInsertContactUseCase,
  //     this._localUpdateContactUseCase,
  //     this._localDeleteContactUseCase
  //     ) : super(const ContactInitial());
  //
  // @override
  // Stream<ContactState> mapEventToState(ContactEvent event) async* {
  //   if (event is GetAllContact) {
  //     try {
  //       yield const ContactLoading();
  //       yield ContactSuccess(await _localGetAllContactUseCase.execute());
  //     } catch (e) {
  //       yield ContactError(e.toString());
  //     }
  //   } else if (event is AddContact) {
  //     try {
  //       yield ContactLoading();
  //       await _localInsertContactUseCase(event.contactEntity);
  //       yield ContactSuccess(await _localGetAllContactUseCase());
  //     } catch (e) {
  //       yield ContactError(e.toString());
  //     }
  //   } else if (event is UpdateContact) {
  //     try {
  //       yield ContactLoading();
  //       await _localUpdateContactUseCase(params: event.contactModel);
  //       yield ContactSuccess(await _localGetAllContactUseCase());
  //     } catch (e) {
  //       yield ContactError(e.toString());
  //     }
  //   } else if (event is DeleteContact) {
  //     try {
  //       yield ContactLoading();
  //       await _localDeleteContactUseCase(params: event.idContact);
  //       yield ContactSuccess(await _localGetAllContactUseCase());
  //     } catch (e) {
  //       yield ContactError(e.toString());
  //     }
  //   }
  // }

  ContactBloc(
      this._localGetAllContactUseCase,
      this._localInsertContactUseCase,
      this._localUpdateContactUseCase,
      this._localDeleteContactUseCase,
      ) : super(const ContactInitial()) {
    on<ContactEvent>((event, emit) async {
      if (event is GetAllContact) {
        emit(const ContactLoading());
        final resultGetContact = await _localGetAllContactUseCase.execute();
        resultGetContact.fold(
              (failure) {
                emit(ContactError(failure.message));
              },
              (data) {
                emit(ContactSuccess(data));
              },
        );
      } else if (event is AddContact) {
        emit(const ContactLoading());
        final resultAddContact = await _localInsertContactUseCase.execute(event.contactEntity);
        await resultAddContact.fold(
              (failure) {
                emit(ContactError(failure.message));
              },
              (data) async {
                final resultGetContact = await _localGetAllContactUseCase.execute();
                resultGetContact.fold(
                      (failure) {
                    emit(ContactError(failure.message));
                  },
                      (data) {
                    emit(ContactSuccess(data));
                  },
                );
              },
        );
      } else if (event is UpdateContact) {
        emit(const ContactLoading());
        final resultAddContact = await _localUpdateContactUseCase.execute(
            event.contactEntity);
        await resultAddContact.fold(
              (failure) {
                emit(ContactError(failure.message));
              },
              (data) async {
                final resultGetContact = await _localGetAllContactUseCase.execute();
                resultGetContact.fold(
                      (failure) {
                    emit(ContactError(failure.message));
                  },
                      (data) {
                    emit(ContactSuccess(data));
                  },
                );
              },
        );
      } else if (event is DeleteContact) {
        emit(const ContactLoading());
        final resultAddContact = await _localDeleteContactUseCase.execute(
            event.idContact);
        await resultAddContact.fold(
              (failure) {
                emit(ContactError(failure.message));
              },
              (data) async {
                final resultGetContact = await _localGetAllContactUseCase.execute();
                resultGetContact.fold(
                      (failure) {
                    emit(ContactError(failure.message));
                  },
                      (data) {
                    emit(ContactSuccess(data));
                  },
                );
              },
        );
      }

    });
  }

}
