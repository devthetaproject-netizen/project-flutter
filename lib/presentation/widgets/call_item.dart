import 'package:flutter/material.dart';
import '../../data/models/call_model.dart';

class CallItem extends StatelessWidget {
  final CallModel call;
  final VoidCallback? onCallTap;

  const CallItem({super.key, required this.call, this.onCallTap});

  Color get _statusColor {
    switch (call.status) {
      case CallStatus.incoming:
        return Colors.blue;
      case CallStatus.outgoing:
        return Colors.green;
      case CallStatus.missed:
        return Colors.red;
    }
  }

  IconData get _statusIcon {
    switch (call.status) {
      case CallStatus.incoming:
        return Icons.call_received;
      case CallStatus.outgoing:
        return Icons.call_made;
      case CallStatus.missed:
        return Icons.call_missed;
    }
  }

  String get _statusLabel {
    switch (call.status) {
      case CallStatus.incoming:
        return 'Incoming';
      case CallStatus.outgoing:
        return 'Outgoing';
      case CallStatus.missed:
        return 'Missed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(call.imagePath),
        onBackgroundImageError: (_, _) {},
        backgroundColor: const Color(0xFFEEEEF5),
      ),
      title: Text(
        call.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: _statusColor,
              shape: BoxShape.circle,
            ),
            child: Icon(_statusIcon, size: 10, color: Colors.white),
          ),
          const SizedBox(width: 6),
          Text(
            '$_statusLabel | ${call.date}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.call_outlined, color: Colors.deepPurple),
        onPressed: onCallTap ?? () => debugPrint("Call ${call.name}"),
      ),
    );
  }
}
