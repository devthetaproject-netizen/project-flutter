enum CallStatus { incoming, outgoing, missed }

class CallModel {
  final String name;
  final String imagePath;
  final CallStatus status;
  final String date;

  const CallModel({
    required this.name,
    required this.imagePath,
    required this.status,
    required this.date,
  });
}
