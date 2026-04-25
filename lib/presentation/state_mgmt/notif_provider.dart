import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/notif_data.dart';
import '../../data/models/notif_model.dart';

// Provider untuk list notifikasi
final notifProvider = StateNotifierProvider<NotifNotifier, List<NotifModel>>(
  (ref) => NotifNotifier(),
);

class NotifNotifier extends StateNotifier<List<NotifModel>> {
  NotifNotifier() : super(NotifData.notifs);

  void markAllAsRead() {
    state = state.map((notif) {
      notif.isRead = true;
      return notif;
    }).toList();
  }
}
