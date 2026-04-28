import 'package:flutter_application_user/data/models/review_model.dart';

class MitraModel {
  final String providerName;
  final String serviceName;
  final double price; // ← angka murni untuk logic
  final String priceLabel; // ← teks untuk UI
  final double rating;
  final int reviewCount;
  final String imagePath;
  final String category;
  final String address; // ← tambah
  final String description; // ← tambah
  final List<String> photos; // ← tambah
  final List<ReviewModel> reviews; // ← tambah

  const MitraModel({
    required this.providerName,
    required this.serviceName,
    required this.price,
    required this.priceLabel,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    required this.category,
    this.address = '',
    this.description = '',
    this.photos = const <String>[], // ← fix ini
    this.reviews = const <ReviewModel>[], // ← fix ini
  });
}
