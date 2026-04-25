import 'package:flutter/material.dart';
import '../../data/datasources/layanan_data.dart';
import '../widgets/layanan_item.dart';

class SeeLayananPage extends StatelessWidget {
  const SeeLayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          children: LayananData.services.map((service) {
            return LayananItem(
              service: service,
              onTap: () {
                debugPrint("Tapped: ${service.label}");
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('All Services'),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'search',
              child: Row(
                children: [
                  Icon(Icons.search, size: 20),
                  SizedBox(width: 8),
                  Text('Search Service'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'search') {
              debugPrint("Search service tapped");
            }
          },
        ),
      ],
    );
  }
}
