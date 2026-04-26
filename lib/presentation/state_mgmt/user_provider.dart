import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/user_data.dart';

final greetingProvider = Provider<String>((ref) {
  final hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) return "Selamat Pagi 👋";
  if (hour >= 12 && hour < 15) return "Selamat Siang 👋";
  if (hour >= 15 && hour < 18) return "Selamat Sore 👋";
  return "Selamat Malam 👋";
});

final userNameProvider = Provider<String>((ref) {
  return UserData.currentUser.name;
});

final userImageProvider = Provider<String>((ref) {
  return UserData.currentUser.imagePath;
});
