import 'package:flutter/material.dart';
import '../../data/datasources/user_data.dart';
import '../../data/models/mitra_model.dart';

class BookingPage extends StatelessWidget {
  final MitraModel? mitra;

  const BookingPage({super.key, this.mitra});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final user = UserData.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Data Mitra'),
            const SizedBox(height: 12),
            _buildDataRow('Nama Mitra', mitra?.providerName ?? '-'),
            _buildDataRow('Layanan', mitra?.serviceName ?? '-'),
            _buildDataRow('Kategori', mitra?.category ?? '-'),
            _buildDataRow('Harga', mitra?.priceLabel ?? '-'),
            _buildDataRow('Rating', '${mitra?.rating ?? '-'} ⭐'),
            const Divider(height: 32),
            _buildSectionTitle('Data User'),
            const SizedBox(height: 12),
            _buildDataRow('Nama', user.name),
            _buildDataRow('Nickname', user.nickname),
            _buildDataRow('Email', user.email),
            _buildDataRow('No. HP', user.phoneNumber),
            _buildDataRow('Alamat', user.address),
            const Divider(height: 32),
            _buildSectionTitle('Waktu Booking'),
            const SizedBox(height: 12),
            _buildDataRow('Tanggal', '${now.day}/${now.month}/${now.year}'),
            _buildDataRow(
              'Jam',
              '${now.hour}:${now.minute.toString().padLeft(2, '0')}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
