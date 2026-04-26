import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/widgets/service_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation/all_services_navigation.dart';
import '../state_mgmt/layanan_provider.dart';

class AllServicesPage extends ConsumerWidget {
  const AllServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layanans = ref.watch(layananProvider); // ← ambil dari provider

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          children: layanans.map((service) {
            return ServiceItem(
              service: service,
              onTap: () =>
                  AllServicesNavigation.toServiceList(context, service.label),
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
