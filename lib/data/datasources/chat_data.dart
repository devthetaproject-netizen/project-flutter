import '../models/chat_model.dart';

class ChatData {
  static List<ChatModel> chats = [
    ChatModel(
      name: "Jenny Wilson",
      message: "I have booked your house ...",
      time: "13.29",
      count: 2,
      imagePath: "assets/images/dummy.jpg",
    ),
    ChatModel(
      name: "Alfonzo",
      message: "Hello bro, show me da way",
      time: "10:00",
      count: 1,
      imagePath: "assets/images/dummy.jpg",
    ),
    ChatModel(
      name: "Benny",
      message: "🔥🔥🔥",
      time: "09.25",
      count: 0,
      imagePath: "assets/images/dummy.jpg",
    ),
  ];
}
