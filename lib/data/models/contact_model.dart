import 'package:db_offline_flutter/domain/entities/contact_entity.dart';

class ContactModel {
  int? idContact;
  String? name;
  String? phone;
  String? address;

  ContactModel({this.idContact, this.name, this.phone, this.address});

  ContactModel.fromMap(Map<String, dynamic> map) {
    idContact = map['id_contact'];
    name = map['name'];
    phone = map['phone'];
    address = map['address'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id_contact': idContact,
      'name': name,
      'phone': phone,
      'address': address,
    };
  }

  factory ContactModel.fromEntity(ContactEntity contactEntity) => ContactModel(
    idContact: contactEntity.idContact,
    name: contactEntity.name,
    phone: contactEntity.phone,
    address: contactEntity.address,
  );

  ContactEntity toEntity() {
    return ContactEntity(
      idContact: idContact,
      name: name,
      phone: phone,
      address: address,
    );
  }
}