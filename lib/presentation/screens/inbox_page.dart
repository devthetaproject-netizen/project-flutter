import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation/inbox_navigation.dart';
import '../state_mgmt/chat_provider.dart';
import '../widgets/chat_item.dart';

class InboxPage extends ConsumerStatefulWidget {
  const InboxPage({super.key});

  @override
  ConsumerState<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends ConsumerState<InboxPage> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(chatProvider);

    return SafeArea(
      child: Column(
        children: [
          _buildHeader(),
          _buildTabBar(),
          const SizedBox(height: 8),
          Expanded(
            child: _activeTab == 0
                ? ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return ChatItem(
                        name: chat.name,
                        message: chat.message,
                        time: chat.time,
                        count: chat.count,
                        imagePath: chat.imagePath,
                        onTap: () =>
                            InboxNavigation.toChatDetail(context, chat),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Calls coming soon!',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
          const SizedBox(width: 12),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            _TabItem(
              title: "Chats",
              active: _activeTab == 0,
              onTap: () => setState(() => _activeTab = 0),
            ),
            const SizedBox(width: 24),
            _TabItem(
              title: "Calls",
              active: _activeTab == 1,
              onTap: () => setState(() => _activeTab = 1),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Divider(height: 1),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool active;
  final VoidCallback? onTap;

  const _TabItem({required this.title, required this.active, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
