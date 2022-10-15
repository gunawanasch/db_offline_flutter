import 'package:equatable/equatable.dart';

class CustomerInfoEntity extends Equatable {
  const CustomerInfoEntity({
    this.idCustomerInfo,
    this.name,
    this.phone,
  });

  final int? idCustomerInfo;
  final String? name;
  final String? phone;

  @override
  List<Object?> get props => [
    idCustomerInfo,
    name,
    phone,
  ];
}