import 'package:db_offline_flutter/domain/entities/contact_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

class ContactInitial extends ContactState {
  const ContactInitial();
  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {
  const ContactLoading();
  @override
  List<Object> get props => [];
}

class ContactSuccess extends ContactState {
  final List<ContactEntity> listContact;
  const ContactSuccess(this.listContact);
  @override
  List<Object> get props => [ContactEntity()];
}

class ContactError extends ContactState {
  final String message;
  const ContactError(this.message);
  @override
  List<Object> get props => [message];
}