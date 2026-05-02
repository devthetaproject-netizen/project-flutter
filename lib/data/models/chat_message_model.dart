class ChatMessageModel {
  final String message;
  final String time;
  final bool isMe;

  const ChatMessageModel({
    required this.message,
    required this.time,
    required this.isMe,
  });
}
