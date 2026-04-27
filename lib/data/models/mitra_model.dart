class MitraModel {
  final String providerName;
  final String serviceName;
  final double price; // ← angka murni untuk logic
  final String priceLabel; // ← teks untuk UI
  final double rating;
  final int reviewCount;
  final String imagePath;
  final String category;

  const MitraModel({
    required this.providerName,
    required this.serviceName,
    required this.price,
    required this.priceLabel,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    required this.category,
  });
}
