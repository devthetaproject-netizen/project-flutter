class MitraModel {
  final String providerName;
  final String serviceName;
  final String price;
  final double rating;
  final int reviewCount;
  final String imagePath;
  final String category;

  const MitraModel({
    required this.providerName,
    required this.serviceName,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    required this.category,
  });
}
