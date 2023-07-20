import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String errorMessage;

  const ErrorMessageModel(this.errorMessage);

  factory ErrorMessageModel.fromJson(String error) => ErrorMessageModel(error);

  @override
  List<Object?> get props => [errorMessage];
}
