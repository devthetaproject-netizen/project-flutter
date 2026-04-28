import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/navigation/detail_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mitra_model.dart';
import '../state_mgmt/bookmark_provider.dart';
import '../widgets/service_card.dart';
import '../widgets/service_pill.dart';

class BookmarkPage extends ConsumerStatefulWidget {
  const BookmarkPage({super.key});

  @override
  ConsumerState<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends ConsumerState<BookmarkPage> {
  String _selectedCategory = 'All';

  List<MitraModel> _filteredBookmarks(List<MitraModel> bookmarks) {
    if (_selectedCategory == 'All') return bookmarks;
    return bookmarks.where((m) => m.category == _selectedCategory).toList();
  }

  void _showRemoveModal(BuildContext context, MitraModel mitra) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Remove from Bookmark?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ServiceCard(mitra: mitra, onBookmarkTap: () {}),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Color(0xFF007B7F)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xFF007B7F)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(bookmarkProvider.notifier).toggle(mitra);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007B7F),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Yes, Remove',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookmarks = ref.watch(bookmarkProvider);
    final filtered = _filteredBookmarks(bookmarks);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
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
            child: bookmarks.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada bookmark',
                      style: TextStyle(color: Colors.black45),
                    ),
                  )
                : filtered.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada bookmark di kategori ini',
                      style: TextStyle(color: Colors.black45),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final mitra = filtered[index];
                      return ServiceCard(
                        mitra: mitra,
                        onTap: () => DetailNavigation.toDetail(context, mitra),
                        onBookmarkTap: () =>
                            _showRemoveModal(context, mitra), // ← tambah ini
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
      title: const Text('My Bookmark'),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => debugPrint("More tapped"),
        ),
      ],
    );
  }
}
