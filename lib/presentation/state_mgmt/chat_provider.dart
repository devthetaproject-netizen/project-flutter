import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/chat_data.dart';
import '../../data/models/chat_model.dart';

final chatProvider = Provider<List<ChatModel>>((ref) {
  return ChatData.chats;
});
