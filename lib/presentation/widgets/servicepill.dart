import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/datasources/layanan_data.dart';

class ServicePills extends StatefulWidget {
  final ValueChanged<String>? onSelected;
  const ServicePills({super.key, this.onSelected});

  @override
  State<ServicePills> createState() => _ServicePillsState();
}

class _ServicePillsState extends State<ServicePills> {
  int selectedIndex = 0;

  List<String> get _services {
    final labels = LayananData.services.map((e) => e.label).toList();
    return ['All', ...labels];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_services.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onSelected?.call(_services[index]);
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
                _services[index],
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
