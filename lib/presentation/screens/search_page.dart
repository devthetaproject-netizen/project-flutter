import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/models/mitra_model.dart';
import 'package:flutter_application_user/presentation/navigation/detail_navigation.dart';
import 'package:flutter_application_user/presentation/state_mgmt/filter_provider.dart';
import 'package:flutter_application_user/presentation/widgets/filter_bottom_sheet.dart';
import 'package:flutter_application_user/presentation/widgets/search_field.dart';
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
    final searchResults = ref.watch(searchFilteredMitraProvider);
    final filter = ref.watch(filterProvider); // ← tambah ini
    final filterApplied = ref.watch(filterAppliedProvider);
    // cek filter aktif di sini
    final isFilterActive =
        filterApplied ||
        filter.category != 'All' ||
        filter.minRating != 0 ||
        filter.priceRange != const RangeValues(0, 500000);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              const SizedBox(height: 16),
              if (query.isNotEmpty || isFilterActive)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(text: 'Results for "'),
                              TextSpan(
                                text: query.isEmpty ? filter.category : query,
                                style: const TextStyle(
                                  color: Color(0xFF007B7F),
                                ),
                              ),
                              const TextSpan(text: '"'),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis, // ← tambah ini
                        ),
                      ),
                      Text(
                        '${searchResults.length} found',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF007B7F),
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: query.isEmpty && !isFilterActive
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
    return SearchField(
      readOnly: false,
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state = value;
      },
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          ref.read(recentSearchProvider.notifier).addSearch(value);
        }
      },
      onFilterTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => UncontrolledProviderScope(
            container: ProviderScope.containerOf(context),
            child: const FilterBottomSheet(),
          ),
        );
      },
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
      return _buildNotFound();
    }

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final mitra = results[index]; // ← ganti filtered ke results
        return ServiceCard(
          mitra: mitra,
          onTap: () => DetailNavigation.toDetail(context, mitra),
        );
      },
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.sentiment_dissatisfied_outlined,
            size: 100,
            color: Color(0xFFCCBBFF),
          ),
          //tambah gambar
          //Image.asset(
          //'assets/images/not_found.png',
          //width: 200,
          //height: 200,),
          //tambah gambar
          const SizedBox(height: 24),
          const Text(
            'Not Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
