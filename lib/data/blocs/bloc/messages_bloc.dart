import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:igce_theme/theme_bloc/theme.dart';
import 'package:meta/meta.dart';
import 'package:test_project/data/models/chatMessage.dart';
import 'package:test_project/data/repositories/sp_repository.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc()
      : super(MessagesState(isLoading: false, messages: null, error: null)) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<LoadMessagesListEvent>(_onLoadMessagesListEvent);
  }

  SPRepository spRepository = GetIt.instance<SPRepository>();

  _onSendMessageEvent(
      SendMessageEvent event, Emitter<MessagesState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      MessageModel userMessage = MessageModel(
          text: event.message, isSentByUser: true, timestamp: DateTime.now());
      String botText = 'Ответ бота';
      MessageModel botMessage = MessageModel(
          text: botText, isSentByUser: false, timestamp: DateTime.now());
      List<MessageModel> chatHistory = [];
      chatHistory = await loadChatHistory();

      chatHistory.add(userMessage);
      chatHistory.add(botMessage);

      await saveChatHistory(chatHistory);

      emit(state.copyWith(messages: chatHistory));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  _onLoadMessagesListEvent(
      LoadMessagesListEvent event, Emitter<MessagesState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      List<MessageModel> chatHistory = await loadChatHistory();

      emit(state.copyWith(messages: chatHistory));
    } catch (e) {
      print(e);
      emit(state.copyWith(error: e.toString()));
    }
  }

  // _onSaveMessagesListEvent(SaveMessagesListEvent event, Emitter<MessagesState> emit) {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     MessageModel userMessage = MessageModel(
  //         text: event.message, isSentByUser: true, timestamp: DateTime.now());
  //     String botText = 'Ответ бота';
  //     MessageModel botMessage = MessageModel(
  //         text: botText, isSentByUser: false, timestamp: DateTime.now());
  //     List<MessageModel> chatHistory = [];
  //     chatHistory = loadChatHistory();
  //     chatHistory.add(userMessage);
  //     chatHistory.add(botMessage);

  //     emit(state.copyWith(messages: chatHistory));

  //     saveChatHistory(chatHistory);
  //   } catch (e) {
  //     emit(state.copyWith(error: e.toString()));
  //   }
  // }

  saveChatHistory(List<MessageModel> chatHistory) async {
    final messages = chatHistory
        .map((msg) => jsonEncode({
              'text': msg.text,
              'isSentByUser': msg.isSentByUser,
              'timestamp': msg.timestamp.toIso8601String(),
            }))
        .toList();
    spRepository.setStringListLocalData('chatHistory', messages);
  }

  loadChatHistory() async {
    final messages = await spRepository.getStringListLocalData('chatHistory');

    List<MessageModel> chatHistory = messages!.map((msg) {
      final data = jsonDecode(msg);
      return MessageModel(
        text: data['text'],
        isSentByUser: data['isSentByUser'],
        timestamp: DateTime.parse(data['timestamp']),
      );
    }).toList();

    return chatHistory;
  }
}
