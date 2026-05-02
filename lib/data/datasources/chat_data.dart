import '../models/chat_model.dart';
import '../models/chat_message_model.dart';

class ChatData {
  static List<ChatModel> chats = [
    ChatModel(
      name: "Jenny Wilson",
      message: "I have booked your house ...",
      time: "13.29",
      count: 2,
      imagePath: "assets/images/dummy.jpg",
      messages: [
        ChatMessageModel(
          message: "Hi Jenny, good morning 😊",
          time: "10:00",
          isMe: true,
        ),
        ChatMessageModel(
          message:
              "I have booked your house cleaning service for December 23 at 10 AM 😁",
          time: "10:00",
          isMe: true,
        ),
        ChatMessageModel(
          message: "Hi, morning too Andrew!",
          time: "10:00",
          isMe: false,
        ),
        ChatMessageModel(
          message:
              "Yes, I have received your order. I will come on that date! 😁😁",
          time: "10:00",
          isMe: false,
        ),
        ChatMessageModel(
          message: "Good, thanks Jenny...",
          time: "10:01",
          isMe: true,
        ),
      ],
    ),
    ChatModel(
      name: "Alfonzo",
      message: "Hello bro, show me da way",
      time: "10:00",
      count: 1,
      imagePath: "assets/images/dummy.jpg",
      messages: [
        ChatMessageModel(
          message: "Hello bro, show me da way",
          time: "10:00",
          isMe: false,
        ),
      ],
    ),
    ChatModel(
      name: "Benny",
      message: "🔥🔥🔥",
      time: "09.25",
      count: 0,
      imagePath: "assets/images/dummy.jpg",
      messages: [
        ChatMessageModel(message: "🔥🔥🔥", time: "09:25", isMe: false),
      ],
    ),
  ];
}
