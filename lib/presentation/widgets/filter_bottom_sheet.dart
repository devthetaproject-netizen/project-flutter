import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/state_mgmt/search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/layanan_data.dart';
import '../state_mgmt/filter_provider.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  late String _selectedCategory;
  late RangeValues _priceRange;
  late double _minRating;

  @override
  void initState() {
    super.initState();
    final filter = ref.read(filterProvider);
    _selectedCategory = filter.category;
    _priceRange = filter.priceRange;
    _minRating = filter.minRating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHandle(),
          const SizedBox(height: 16),
          _buildTitle(),
          const Divider(),
          const SizedBox(height: 16),
          _buildCategorySection(),
          const SizedBox(height: 24),
          _buildPriceSection(),
          const SizedBox(height: 24),
          _buildRatingSection(),
          const SizedBox(height: 32),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Center(
      child: Text(
        'Filter',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = ['All', ...LayananData.services.map((e) => e.label)];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              final isSelected = _selectedCategory == category;
              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = category),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF007B7F) : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color(0xFF007B7F),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF007B7F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        RangeSlider(
          values: _priceRange,
          min: 0,
          max: 500000,
          divisions: 100,
          activeColor: const Color(0xFF007B7F),
          labels: RangeLabels(
            'Rp ${_priceRange.start.toInt()}',
            'Rp ${_priceRange.end.toInt()}',
          ),
          onChanged: (values) => setState(() => _priceRange = values),
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    final ratings = [0.0, 5.0, 4.0, 3.0, 2.0];
    final labels = ['All', '5', '4', '3', '2'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rating',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(ratings.length, (index) {
              final isSelected = _minRating == ratings[index];
              return GestureDetector(
                onTap: () => setState(() => _minRating = ratings[index]),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF007B7F) : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color(0xFF007B7F),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF007B7F),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        labels[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF007B7F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              ref.read(filterProvider.notifier).reset();
              ref.read(filterAppliedProvider.notifier).state = false;
              ref.read(searchQueryProvider.notifier).state =
                  ''; // ← reset query
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Color(0xFF007B7F)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Reset',
              style: TextStyle(color: Color(0xFF007B7F)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final notifier = ref.read(filterProvider.notifier);
              notifier.setCategory(_selectedCategory);
              notifier.setPriceRange(_priceRange);
              notifier.setMinRating(_minRating);
              ref.read(filterAppliedProvider.notifier).state = true;
              ref.read(searchQueryProvider.notifier).state = '';

              // simpan category ke recent
              if (_selectedCategory != 'All') {
                ref
                    .read(recentSearchProvider.notifier)
                    .addSearch(_selectedCategory);
              }

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF007B7F),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Filter', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
