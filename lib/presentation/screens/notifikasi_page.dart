import 'package:flutter/material.dart';
import '../../data/datasources/notif_data.dart';
import '../../data/models/notif_model.dart';
import '../widgets/notif_item.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  List<NotifModel> get _notifs => NotifData.notifs;

  void _markAllAsRead() {
    setState(() {
      for (var notif in _notifs) {
        notif.isRead = true;
      }
    });
  }

  Map<String, List<NotifModel>> get _groupedNotifs {
    final Map<String, List<NotifModel>> grouped = {};
    final now = DateTime.now();

    for (var notif in _notifs) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: _groupedNotifs.entries.map((entry) {
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

  AppBar _buildAppBar() {
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
            if (value == 'mark_all') _markAllAsRead();
          },
        ),
      ],
    );
  }
}
