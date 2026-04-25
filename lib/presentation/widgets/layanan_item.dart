import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/models/layanan_model.dart';

class LayananItem extends StatelessWidget {
  final LayananModel service;
  final VoidCallback? onTap;

  const LayananItem({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: service.color,
              shape: BoxShape.circle,
            ),
            child: Icon(service.icon, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            service.label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
