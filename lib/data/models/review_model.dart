class ReviewModel {
  final String reviewerName;
  final String reviewerImage;
  final double rating;
  final String comment;
  final int likes;
  final String timeAgo;

  const ReviewModel({
    required this.reviewerName,
    required this.reviewerImage,
    required this.rating,
    required this.comment,
    required this.likes,
    required this.timeAgo,
  });
}
