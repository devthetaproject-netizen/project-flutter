import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mitra_model.dart';

final bookmarkProvider =
    StateNotifierProvider<BookmarkNotifier, List<MitraModel>>(
      (ref) => BookmarkNotifier(),
    );

class BookmarkNotifier extends StateNotifier<List<MitraModel>> {
  BookmarkNotifier() : super([]);

  void toggle(MitraModel mitra) {
    if (isBookmarked(mitra)) {
      state = state.where((m) => m != mitra).toList();
    } else {
      state = [...state, mitra];
    }
  }

  bool isBookmarked(MitraModel mitra) {
    return state.any((m) => m == mitra);
  }
}

// Provider untuk cek status bookmark per mitra
final isBookmarkedProvider = Provider.family<bool, MitraModel>((ref, mitra) {
  final bookmarks = ref.watch(bookmarkProvider);
  return bookmarks.any((m) => m == mitra);
});
