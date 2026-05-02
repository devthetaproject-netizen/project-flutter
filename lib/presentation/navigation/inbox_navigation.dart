import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/screens/chat_detail_page.dart';
import '../../data/models/chat_model.dart';

class InboxNavigation {
  static void toChatDetail(BuildContext context, ChatModel chat) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ChatDetailPage(chat: chat)),
    );
  }
}
