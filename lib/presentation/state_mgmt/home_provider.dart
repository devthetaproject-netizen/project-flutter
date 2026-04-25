import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/mitra_data.dart';
import '../../data/models/mitra_model.dart';

// Provider untuk kategori yang dipilih
final selectedCategoryProvider = StateProvider<String>((ref) => 'All');

// Provider untuk filtered mitra
final filteredMitraProvider = Provider<List<MitraModel>>((ref) {
  final category = ref.watch(selectedCategoryProvider);

  if (category == 'All') return MitraData.mitras;
  return MitraData.mitras.where((m) => m.category == category).toList();
});
