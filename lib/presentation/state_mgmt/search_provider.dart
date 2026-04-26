import 'package:flutter_application_user/domain/repositories/local_mitra_repository.dart';
import 'package:flutter_application_user/domain/repositories/mitra_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mitra_model.dart';

// Repository provider
final mitraRepositoryProvider = Provider<MitraRepository>((ref) {
  return LocalMitraRepository();
});

// Search query provider
final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');

// Recent searches provider
final recentSearchProvider =
    StateNotifierProvider<RecentSearchNotifier, List<String>>(
      (ref) => RecentSearchNotifier(),
    );

class RecentSearchNotifier extends StateNotifier<List<String>> {
  RecentSearchNotifier()
    : super([
        'Motorcycle Repairing',
        'Painting the Walls',
        'Water Faucet Repairing',
        'Window Cleaning',
        'House Shifting',
        'Computer Repairing',
        'Cloth Laundry',
        'Floor Wash',
      ]);

  void addSearch(String query) {
    if (query.isEmpty) return;
    state = [query, ...state.where((s) => s != query)];
  }

  void removeSearch(String query) {
    state = state.where((s) => s != query).toList();
  }

  void clearAll() {
    state = [];
  }
}

// Search result provider
final searchResultProvider = Provider.autoDispose<List<MitraModel>>((ref) {
  final query = ref.watch(searchQueryProvider);
  final repository = ref.watch(mitraRepositoryProvider);
  return repository.search(query);
});
