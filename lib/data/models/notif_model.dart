import 'package:flutter/material.dart';

class NotifModel {
  final String title;
  final String subtitle;
  final DateTime dateTime;
  final Color iconColor;
  final IconData icon;
  bool isRead;

  NotifModel({
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.iconColor,
    required this.icon,
    this.isRead = false,
  });
}
