import 'package:db_offline_flutter/model/customer_info_model.dart';
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
  final List<CustomerInfoModel> listCustomerInfo;
  const CustomerInfoSuccess(this.listCustomerInfo);
  @override
  List<Object> get props => [CustomerInfoModel()];
}

class CustomerInfoError extends CustomerInfoState {
  final String message;
  const CustomerInfoError(this.message);
  @override
  List<Object> get props => [message];
}