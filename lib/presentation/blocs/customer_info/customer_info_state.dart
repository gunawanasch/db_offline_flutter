import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerInfoState extends Equatable {
  const CustomerInfoState();
}

class CustomerInfoInitial extends CustomerInfoState {
  const CustomerInfoInitial();
  @override
  List<Object> get props => [];
}

class CustomerInfoLoading extends CustomerInfoState {
  const CustomerInfoLoading();
  @override
  List<Object> get props => [];
}

class CustomerInfoSuccess extends CustomerInfoState {
  final List<CustomerInfoEntity> listCustomerInfo;
  const CustomerInfoSuccess(this.listCustomerInfo);
  @override
  List<Object> get props => [CustomerInfoEntity()];
}

class CustomerInfoError extends CustomerInfoState {
  final String message;
  const CustomerInfoError(this.message);
  @override
  List<Object> get props => [message];
}