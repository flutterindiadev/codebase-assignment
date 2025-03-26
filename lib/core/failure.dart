import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final dynamic responseLogs;
  final String message;

  const Failure({
    required this.message,
    this.responseLogs,
  });

  factory Failure.fromUnknownException() => const Failure(
        message: 'Something went wrong',
      );

  factory Failure.fromMessage(String message) => Failure(
        message: message,
      );

  @override
  String toString() => message;

  @override
  List<Object?> get props => [
        message,
      ];
}
