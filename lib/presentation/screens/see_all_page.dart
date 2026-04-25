import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/widgets/servicepill.dart';
import '../../data/datasources/mitra_data.dart';
import '../../data/models/mitra_model.dart';
import '../widgets/service_card.dart';

class SeeAllPage extends StatefulWidget {
  final String category;

  const SeeAllPage({super.key, this.category = 'All'});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.category; // ← ambil dari parameter
  }

  List<MitraModel> get _filteredMitras {
    if (_selectedCategory == 'All') return MitraData.mitras;
    return MitraData.mitras
        .where((m) => m.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          if (widget.category == 'All')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ServicePills(
                onSelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
          Expanded(
            child: _filteredMitras.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada layanan tersedia',
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredMitras.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        mitra: _filteredMitras[index],
                        onTap: () {
                          debugPrint(
                            "Tapped: ${_filteredMitras[index].serviceName}",
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

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_selectedCategory), // ← judul ikut kategori
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'filter', child: Text('Filter')),
            const PopupMenuItem(value: 'sort', child: Text('Sort by Rating')),
          ],
          onSelected: (value) {
            debugPrint("Selected: $value");
          },
        ),
      ],
    );
  }
}
