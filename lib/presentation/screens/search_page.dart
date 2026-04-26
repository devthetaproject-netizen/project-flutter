import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/models/mitra_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_mgmt/search_provider.dart';
import '../widgets/recent_item.dart';
import '../widgets/section_header.dart';
import '../widgets/service_card.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final recentSearches = ref.watch(recentSearchProvider);
    final searchResults = ref.watch(searchResultProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              _buildSearchField(),
              const SizedBox(height: 16),
              Expanded(
                child: query.isEmpty
                    ? _buildRecentSearches(recentSearches)
                    : _buildSearchResults(searchResults),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _controller,
      autofocus: true,
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state = value;
      },
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          ref.read(recentSearchProvider.notifier).addSearch(value);
        }
      },
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF007B7F)),
        suffixIcon: IconButton(
          icon: const Icon(Icons.tune, color: Color(0xFF007B7F)),
          onPressed: () => debugPrint("Filter tapped"),
        ),
        filled: true,
        fillColor: const Color(0xFFF0EEFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF007B7F), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF007B7F), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF007B7F), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildRecentSearches(List<String> recentSearches) {
    if (recentSearches.isEmpty) {
      return const Center(
        child: Text(
          'Tidak ada pencarian terbaru',
          style: TextStyle(color: Colors.black45),
        ),
      );
    }

    return Column(
      children: [
        SectionHeader(
          title: 'Recent',
          actionText: 'Clear All',
          onActionTap: () {
            ref.read(recentSearchProvider.notifier).clearAll();
          },
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: recentSearches.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return RecentItem(
                label: recentSearches[index],
                onTap: () {
                  _controller.text = recentSearches[index];
                  ref.read(searchQueryProvider.notifier).state =
                      recentSearches[index];
                },
                onRemove: () {
                  ref
                      .read(recentSearchProvider.notifier)
                      .removeSearch(recentSearches[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults(List<MitraModel> results) {
    if (results.isEmpty) {
      return const Center(
        child: Text(
          'Tidak ada hasil ditemukan',
          style: TextStyle(color: Colors.black45),
        ),
      );
    }

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return ServiceCard(
          mitra: results[index],
          onTap: () => debugPrint("Tapped: ${results[index].serviceName}"),
        );
      },
    );
  }
}
