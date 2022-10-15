import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  ContactEntity({
    this.idContact,
    this.name,
    this.phone,
    this.address,
  });

  late int? idContact;
  late String? name;
  late String? phone;
  late String? address;

  @override
  List<Object?> get props => [
    idContact,
    name,
    phone,
    address,
  ];
}