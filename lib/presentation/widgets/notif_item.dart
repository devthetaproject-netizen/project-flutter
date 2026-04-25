import 'package:flutter/material.dart';
import '../../data/models/notif_model.dart';

class NotifItem extends StatelessWidget {
  final NotifModel notif;

  const NotifItem({super.key, required this.notif});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 12),
          Expanded(child: _buildText()),
          if (!notif.isRead)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF007B7F),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: notif.iconColor, shape: BoxShape.circle),
      child: Icon(notif.icon, color: Colors.white, size: 22),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notif.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: notif.isRead ? FontWeight.normal : FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          notif.subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
