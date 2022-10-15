import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;
}

class GlobalDataFailure extends Failure {
  const GlobalDataFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}