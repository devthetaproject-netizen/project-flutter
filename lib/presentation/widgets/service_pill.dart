import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_mgmt/layanan_provider.dart';

class ServicePills extends ConsumerStatefulWidget {
  final ValueChanged<String>? onSelected;
  const ServicePills({super.key, this.onSelected});

  @override
  ConsumerState<ServicePills> createState() => _ServicePillsState();
}

class _ServicePillsState extends ConsumerState<ServicePills> {
  int selectedIndex = 0;

  List<String> _getServices(List layanans) {
    final labels = layanans.map((e) => e.label).toList();
    return ['All', ...labels];
  }

  @override
  Widget build(BuildContext context) {
    final layanans = ref.watch(layananProvider);
    final services = _getServices(layanans);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(services.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onSelected?.call(services[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF007B7F) : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFF007B7F), width: 1.5),
              ),
              child: Text(
                services[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF007B7F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
