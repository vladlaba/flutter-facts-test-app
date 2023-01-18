import 'package:equatable/equatable.dart';

abstract class MessageState extends Equatable {
  final String message;

  const MessageState(this.message);

  @override
  List<Object?> get props => [message];
}
