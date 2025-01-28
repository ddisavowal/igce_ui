part of 'messages_bloc.dart';

@immutable
sealed class MessagesEvent {}

class SendMessageEvent extends MessagesEvent {
  final String message;

  SendMessageEvent({required this.message});
}

class LoadMessagesListEvent extends MessagesEvent {}

class SaveMessagesListEvent extends MessagesEvent {}
