import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/screens/chat_detail_page.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int count;
  final String imagePath;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.count,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailPage(name: name, imagePath: imagePath),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(radius: 26, backgroundImage: AssetImage(imagePath)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          if (count > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
