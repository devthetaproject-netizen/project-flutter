import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/datasources/layanan_data.dart';
import 'package:flutter_application_user/data/models/layanan_model.dart';
import 'package:flutter_application_user/presentation/screens/see_all_page.dart';
import 'package:flutter_application_user/presentation/screens/see_layanan_page.dart';
import 'package:flutter_application_user/presentation/widgets/layanan_item.dart';

class LayananWidget extends StatelessWidget {
  final Function(LayananModel)? onTap;

  const LayananWidget({super.key, this.onTap});

  List<LayananModel> get _displayList {
    final list = List<LayananModel>.from(LayananData.services);
    if (LayananData.services.length >= 7) {
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
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: _displayList.map((service) {
        return LayananItem(
          service: service,
          onTap: () {
            if (service.label == 'More') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SeeLayananPage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeAllPage(
                    category: service.label, // ← kirim kategori!
                  ),
                ),
              );
            }
          },
        );
      }).toList(),
    );
  }
}
