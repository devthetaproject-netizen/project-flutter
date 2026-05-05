import '../models/call_model.dart';

class CallData {
  static const List<CallModel> calls = [
    CallModel(
      name: "Nikki Lauda",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.incoming,
      date: "Dec 19, 2024",
    ),
    CallModel(
      name: "Jim Clark",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.outgoing,
      date: "Dec 17, 2024",
    ),
    CallModel(
      name: "Jackie Stewart",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.missed,
      date: "Nov 28, 2024",
    ),
    CallModel(
      name: "Nigel Mansell",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.outgoing,
      date: "Nov 24, 2024",
    ),
    CallModel(
      name: "Fernando Alonso",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.incoming,
      date: "Nov 14, 2024",
    ),
    CallModel(
      name: "Ayrton Senna",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.outgoing,
      date: "Oct 30, 2024",
    ),
    CallModel(
      name: "Alain Prost",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.incoming,
      date: "Oct 29, 2024",
    ),
    CallModel(
      name: "Sebastian Vettel",
      imagePath: "assets/images/dummy.jpg",
      status: CallStatus.missed,
      date: "Oct 25, 2024",
    ),
  ];
}
