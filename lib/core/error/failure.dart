import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
}
