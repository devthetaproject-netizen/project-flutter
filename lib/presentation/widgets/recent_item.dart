import 'package:flutter/material.dart';

class RecentItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  const RecentItem({super.key, required this.label, this.onTap, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.close, size: 14, color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
