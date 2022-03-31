import 'package:db_offline_flutter/bloc/contact/contact_event.dart';
import 'package:db_offline_flutter/bloc/contact/contact_state.dart';
import 'package:db_offline_flutter/repository/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository _contactRepository;

  ContactBloc(this._contactRepository) : super(ContactInitial());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is GetAllContact) {
      try {
        yield ContactLoading();
        yield ContactSuccess(await _contactRepository.getAllContact());
      } catch (e) {
        yield ContactError(e.toString());
      }
    } else if (event is AddContact) {
      try {
        yield ContactLoading();
        await _contactRepository.insertContact(event.contactModel);
        yield ContactSuccess(await _contactRepository.getAllContact());
      } catch (e) {
        yield ContactError(e.toString());
      }
    } else if (event is UpdateContact) {
      try {
        yield ContactLoading();
        await _contactRepository.updateContact(event.contactModel);
        yield ContactSuccess(await _contactRepository.getAllContact());
      } catch (e) {
        yield ContactError(e.toString());
      }
    } else if (event is DeleteContact) {
      try {
        yield ContactLoading();
        await _contactRepository.deleteContact(event.idContact);
        yield ContactSuccess(await _contactRepository.getAllContact());
      } catch (e) {
        yield ContactError(e.toString());
      }
    }
  }
}
