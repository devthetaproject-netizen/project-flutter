import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/widgets/service_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/layanan_model.dart';
import '../navigation/service_grid_navigation.dart';
import '../state_mgmt/layanan_provider.dart';

class ServiceGridWidget extends ConsumerWidget {
  const ServiceGridWidget({super.key});

  List<LayananModel> _displayList(List<LayananModel> services) {
    final list = List<LayananModel>.from(services);
    if (services.length >= 7) {
      list.add(
        const LayananModel(
          icon: Icons.more_horiz,
          label: "More",
          color: Color(0xFFE1BEE7),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layanans = ref.watch(layananProvider);
    final displayList = _displayList(layanans);

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: displayList.map((service) {
        return ServiceItem(
          service: service,
          onTap: () {
            if (service.label == 'More') {
              ServiceGridNavigation.toAllServices(context);
            } else {
              ServiceGridNavigation.toServiceList(context, service.label);
            }
          },
        );
      }).toList(),
    );
  }
}
