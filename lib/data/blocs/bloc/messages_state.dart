part of 'messages_bloc.dart';

@immutable
class MessagesState extends Equatable {
  final bool isLoading;
  final List<MessageModel>? messages;
  final String? error;

  MessagesState(
      {required this.isLoading, required this.messages, required this.error});

  MessagesState copyWith({
    bool isLoading = false,
    List<MessageModel>? messages,
    String? error,
  }) {
    return MessagesState(
      isLoading: isLoading,
      messages: messages ?? this.messages,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        messages,
        error,
      ];
}
