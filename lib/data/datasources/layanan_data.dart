import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/models/layanan_model.dart';

class LayananData {
  static const List<LayananModel> services = [
    LayananModel(
      icon: Icons.cleaning_services,
      label: "Cleaning",
      color: Color(0xFFE1BEE7),
    ),
    LayananModel(
      icon: Icons.build,
      label: "Repairing",
      color: Color(0xFFFFE0B2),
    ),
    LayananModel(
      icon: Icons.grass,
      label: "Gardening",
      color: Color(0xFFC8E6C9),
    ),
    LayananModel(
      icon: Icons.local_laundry_service,
      label: "Laundry",
      color: Color(0xFFFFF9C4),
    ),
    LayananModel(icon: Icons.tv, label: "Electronic", color: Color(0xFFFFCDD2)),
    LayananModel(
      icon: Icons.plumbing,
      label: "Plumbing",
      color: Color(0xFFBBDEFB),
    ),
    LayananModel(
      icon: Icons.ac_unit,
      label: "AC Cleaning",
      color: Color(0xFFB2EBF2),
    ),
  ];
}
