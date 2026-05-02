import 'chat_message_model.dart';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final int count;
  final String imagePath;
  final List<ChatMessageModel> messages;

  const ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.count,
    required this.imagePath,
    this.messages = const [],
  });
}
