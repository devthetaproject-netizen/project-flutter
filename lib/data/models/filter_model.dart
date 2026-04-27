import 'package:flutter/material.dart';

class FilterModel {
  final String category;
  final RangeValues priceRange;
  final double minRating;

  const FilterModel({
    this.category = 'All',
    this.priceRange = const RangeValues(0, 500000),
    this.minRating = 0,
  });

  FilterModel copyWith({
    String? category,
    RangeValues? priceRange,
    double? minRating,
  }) {
    return FilterModel(
      category: category ?? this.category,
      priceRange: priceRange ?? this.priceRange,
      minRating: minRating ?? this.minRating,
    );
  }
}
