import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/widgets/chat_bubble.dart';

class ChatDetailPage extends StatelessWidget {
  final String name;
  final String imagePath;

  const ChatDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      // HEADER
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text(name, style: const TextStyle(color: Colors.black)),
        actions: const [
          Icon(Icons.call_outlined, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        children: [
          // CHAT AREA
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Center(child: _DateLabel()),

                SizedBox(height: 12),

                // RIGHT (ME)
                ChatBubble(
                  message: "Hi Jenny, good morning 😊",
                  time: "10:00",
                  isMe: true,
                ),

                ChatBubble(
                  message:
                      "I have booked your house cleaning service for December 23 at 10 AM 😁",
                  time: "10:00",
                  isMe: true,
                ),

                // LEFT
                ChatBubble(
                  message: "Hi, morning too Andrew!",
                  time: "10:00",
                  isMe: false,
                ),

                ChatBubble(
                  message:
                      "Yes, I have received your order. I will come on that date! 😁😁",
                  time: "10:00",
                  isMe: false,
                ),

                // RIGHT
                ChatBubble(
                  message: "Good, thanks Jenny...",
                  time: "10:01",
                  isMe: true,
                ),
              ],
            ),
          ),

          const _ChatInput(),
        ],
      ),
    );
  }
}

class _DateLabel extends StatelessWidget {
  const _DateLabel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text("Today", style: TextStyle(fontSize: 12)),
    );
  }
}

class _ChatInput extends StatelessWidget {
  const _ChatInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Message...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // MIC BUTTON
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF9C4DFF), Color(0xFF6A00F4)],
              ),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.mic, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
