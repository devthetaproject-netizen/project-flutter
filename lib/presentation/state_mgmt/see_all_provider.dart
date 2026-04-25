import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/mitra_data.dart';
import '../../data/models/mitra_model.dart';

// Provider untuk kategori di SeeAllPage
final seeAllCategoryProvider = StateProvider<String>((ref) => 'All');

// Provider untuk filtered mitra di SeeAllPage
final seeAllMitraProvider = Provider.family<List<MitraModel>, String>((
  ref,
  category,
) {
  final selected = ref.watch(seeAllCategoryProvider);
  if (selected == 'All') return MitraData.mitras;
  return MitraData.mitras.where((m) => m.category == selected).toList();
});
