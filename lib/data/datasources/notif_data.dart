import 'package:flutter/material.dart';
import '../models/notif_model.dart';

class NotifData {
  static List<NotifModel> notifs = [
    NotifModel(
      title: "Pembayaran Berhasil",
      subtitle: "Kamu berhasil melakukan pembayaran",
      dateTime: DateTime.now(),
      iconColor: Colors.purple,
      icon: Icons.wallet,
    ),
    NotifModel(
      title: "Layanan Terbaru",
      subtitle: "Sekarang Layanan Home Servis sudah tersedia di kotamu",
      dateTime: DateTime.now(),
      iconColor: Colors.red,
      icon: Icons.grid_view,
    ),
    NotifModel(
      title: "Today's Special Offers",
      subtitle: "Kamu mendapatkan promo special",
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      iconColor: Colors.orange,
      icon: Icons.local_offer,
    ),
    NotifModel(
      title: "Credit Card Connected!",
      subtitle: "Kartu Kredit sudah terhubung",
      dateTime: DateTime(2025, 12, 25),
      iconColor: Colors.blue,
      icon: Icons.credit_card,
    ),
    NotifModel(
      title: "Account Setup Successful!",
      subtitle: "Your account has been created",
      dateTime: DateTime(2025, 12, 25),
      iconColor: Colors.green,
      icon: Icons.person,
    ),
  ];
}
