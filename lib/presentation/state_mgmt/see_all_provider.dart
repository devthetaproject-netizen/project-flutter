import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/mitra_data.dart';
import '../../data/models/mitra_model.dart';

// Provider untuk kategori di ServiceListPage autodispose dipelajari lagi dikaaaaa
final serviceListCategoryProvider = StateProvider.autoDispose<String>(
  (ref) => 'All',
);

// Provider untuk filtered mitra di ServiceListPage
final serviceListMitraProvider = Provider.autoDispose
    .family<List<MitraModel>, String>((ref, category) {
      // kalau dari kategori spesifik → pakai parameter langsung
      if (category != 'All') {
        return MitraData.mitras.where((m) => m.category == category).toList();
      }
      // kalau dari All → pakai seeAllCategoryProvider
      final selected = ref.watch(serviceListCategoryProvider);
      if (selected == 'All') return MitraData.mitras;
      return MitraData.mitras.where((m) => m.category == selected).toList();
    });
