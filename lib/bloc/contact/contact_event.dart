import 'package:db_offline_flutter/model/contact_model.dart';

abstract class ContactEvent {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

// class Contact extends ContactEvent {
//
//   @override
//   List<Object>? get props => null;
//
// }

class GetAllContact extends ContactEvent {

  GetAllContact();

  @override
  List<Object> get props => [];

}

class AddContact extends ContactEvent {
  final ContactModel contactModel;

  AddContact({required this.contactModel});

}

class UpdateContact extends ContactEvent {
  final ContactModel contactModel;

  UpdateContact({required this.contactModel});

}

class DeleteContact extends ContactEvent {
  final int idContact;

  DeleteContact({required this.idContact});

}