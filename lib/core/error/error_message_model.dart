import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String errorMessage;

  const ErrorMessageModel(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
