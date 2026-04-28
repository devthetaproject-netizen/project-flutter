import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/models/mitra_model.dart';
import 'package:flutter_application_user/presentation/state_mgmt/bookmark_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceCard extends ConsumerWidget {
  final MitraModel mitra;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const ServiceCard({
    super.key,
    required this.mitra,
    this.onTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(isBookmarkedProvider(mitra));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildImage(),
            Expanded(child: _buildInfo(ref, isBookmarked)),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      ),
      child: Image.asset(
        mitra.imagePath,
        width: 120,
        height: 160,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 120,
            height: 160,
            color: const Color(0xFFEEEEF5),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 48,
                color: Color(0xFFAAAAAA),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfo(WidgetRef ref, bool isBookmarked) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopRow(ref, isBookmarked),
          const SizedBox(height: 4),
          _buildServiceName(),
          const SizedBox(height: 4),
          _buildPrice(),
          const Spacer(),
          _buildRating(),
        ],
      ),
    );
  }

  Widget _buildTopRow(WidgetRef ref, bool isBookmarked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mitra.providerName,
          style: const TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
        ),
        GestureDetector(
          onTap:
              onBookmarkTap ??
              () => ref.read(bookmarkProvider.notifier).toggle(mitra),
          child: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: const Color(0xFF007B7F),
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceName() {
    return Text(
      mitra.serviceName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPrice() {
    return Text(
      mitra.priceLabel,
      style: const TextStyle(fontSize: 13, color: Colors.black54),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 4),
        Text(
          "${mitra.rating} | ${mitra.reviewCount} reviews",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
