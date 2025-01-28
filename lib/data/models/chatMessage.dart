class MessageModel {
  final String text;
  final bool isSentByUser; // true, если отправлено клиентом; false, если ботом
  final DateTime timestamp; //дата и время отправки
  MessageModel({
    required this.text,
    required this.isSentByUser,
    required this.timestamp,
  });
}
