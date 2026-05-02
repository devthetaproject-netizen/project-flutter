import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/chat_item.dart';
import '../state_mgmt/chat_provider.dart';

class InboxPage extends ConsumerWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatProvider); // ✅ langsung di sini

    return SafeArea(
      child: Column(
        children: [
          _header(),
          _tabBar(),
          const SizedBox(height: 8),

          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ChatItem(
                  name: chat.name,
                  message: chat.message,
                  time: chat.time,
                  count: chat.count,
                  imagePath: chat.imagePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.message, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Text(
            "Inbox",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.search),
          SizedBox(width: 12),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(width: 16),
            _TabItem(title: "Chats", active: true),
            SizedBox(width: 24),
            _TabItem(title: "Calls", active: false),
          ],
        ),
        const SizedBox(height: 6),
        Divider(height: 1),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool active;

  const _TabItem({required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: active ? Colors.deepPurple : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        if (active) Container(height: 2, width: 60, color: Colors.deepPurple),
      ],
    );
  }
}
