import 'package:equatable/equatable.dart';

abstract class CustomerInfoEvent extends Equatable {
  const CustomerInfoEvent();
}

class CustomerInfo extends CustomerInfoEvent {

  @override
  List<Object> get props => [];

}