
import 'package:db_offline_flutter/domain/entities/contact_entity.dart';

abstract class ContactEvent {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetAllContact extends ContactEvent {

  GetAllContact();

  @override
  List<Object> get props => [];

}

class AddContact extends ContactEvent {
  final ContactEntity contactEntity;

  AddContact({required this.contactEntity});

}

class UpdateContact extends ContactEvent {
  final ContactEntity contactEntity;

  UpdateContact({required this.contactEntity});

}

class DeleteContact extends ContactEvent {
  final int idContact;

  DeleteContact({required this.idContact});

}