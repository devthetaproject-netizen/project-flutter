import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int count;
  final String imagePath;
  final VoidCallback? onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.count,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(imagePath),
        onBackgroundImageError: (_, _) {},
      ),
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
