import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/widgets/service_pill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_mgmt/see_all_provider.dart';
import '../widgets/service_card.dart';

class ServiceListPage extends ConsumerWidget {
  final String category;

  const ServiceListPage({super.key, this.category = 'All'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMitras = ref.watch(serviceListMitraProvider(category));

    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: Column(
        children: [
          if (category == 'All')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ServicePills(
                onSelected: (selected) {
                  ref.read(serviceListCategoryProvider.notifier).state =
                      selected;
                },
              ),
            ),
          Expanded(
            child: filteredMitras.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada layanan tersedia',
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredMitras.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        mitra: filteredMitras[index],
                        onTap: () {
                          debugPrint(
                            "Tapped: ${filteredMitras[index].serviceName}",
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(category == 'All' ? 'Most Popular Service' : category),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            debugPrint("Search tapped");
          },
        ),
      ],
    );
  }
}
