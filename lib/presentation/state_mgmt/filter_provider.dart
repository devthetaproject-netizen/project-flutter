import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/mitra_data.dart';
import '../../data/models/filter_model.dart';
import '../../data/models/mitra_model.dart';
import 'search_provider.dart';

final filterProvider =
    StateNotifierProvider.autoDispose<FilterNotifier, FilterModel>(
      (ref) => FilterNotifier(),
    );
final filterAppliedProvider = StateProvider.autoDispose<bool>((ref) => false);

class FilterNotifier extends StateNotifier<FilterModel> {
  FilterNotifier() : super(const FilterModel());

  void setCategory(String category) {
    state = state.copyWith(category: category);
  }

  void setPriceRange(RangeValues range) {
    state = state.copyWith(priceRange: range);
  }

  void setMinRating(double rating) {
    state = state.copyWith(minRating: rating);
  }

  void reset() {
    state = const FilterModel();
  }
}

final searchFilteredMitraProvider = Provider.autoDispose<List<MitraModel>>((
  ref,
) {
  final filter = ref.watch(filterProvider);
  final query = ref.watch(searchQueryProvider);

  return MitraData.mitras.where((m) {
    final matchCategory =
        filter.category == 'All' || m.category == filter.category;
    final matchPrice =
        m.price >= filter.priceRange.start && m.price <= filter.priceRange.end;
    final matchRating = m.rating >= filter.minRating;
    final matchQuery =
        query.isEmpty ||
        m.serviceName.toLowerCase().contains(query.toLowerCase()) ||
        m.category.toLowerCase().contains(query.toLowerCase()) ||
        m.providerName.toLowerCase().contains(query.toLowerCase());

    return matchCategory && matchPrice && matchRating && matchQuery;
  }).toList();
});
