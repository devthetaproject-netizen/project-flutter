import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_mgmt/notif_provider.dart';
import '../widgets/notif_item.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  Map<String, List<dynamic>> _groupedNotifs(List notifs) {
    final Map<String, List<dynamic>> grouped = {};
    final now = DateTime.now();

    for (var notif in notifs) {
      final diff = now.difference(notif.dateTime).inDays;
      String label;

      if (diff == 0) {
        label = 'Hari ini';
      } else if (diff == 1) {
        label = 'Kemarin';
      } else {
        label =
            '${notif.dateTime.day} ${_monthName(notif.dateTime.month)} ${notif.dateTime.year}';
      }

      grouped.putIfAbsent(label, () => []).add(notif);
    }
    return grouped;
  }

  String _monthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifs = ref.watch(notifProvider);
    final grouped = _groupedNotifs(notifs);

    return Scaffold(
      appBar: _buildAppBar(ref),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                entry.key,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              ...entry.value.map((notif) => NotifItem(notif: notif)),
            ],
          );
        }).toList(),
      ),
    );
  }

  AppBar _buildAppBar(WidgetRef ref) {
    return AppBar(
      title: const Text('Notification'),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'mark_all',
              child: Text('Mark all as read'),
            ),
          ],
          onSelected: (value) {
            if (value == 'mark_all') {
              ref.read(notifProvider.notifier).markAllAsRead();
            }
          },
        ),
      ],
    );
  }
}
