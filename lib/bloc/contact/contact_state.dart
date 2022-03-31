import 'package:db_offline_flutter/model/contact_model.dart';

abstract class ContactState {
  ContactState();
}

class ContactInitial extends ContactState {
  ContactInitial();
  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {
  ContactLoading();
  @override
  List<Object> get props => [];
}

class ContactSuccess extends ContactState {
  final List<ContactModel> listContact;
  ContactSuccess(this.listContact);
  @override
  List<Object> get props => [ContactModel()];
}

class ContactError extends ContactState {
  final String message;
  ContactError(this.message);
  @override
  List<Object> get props => [message];
}