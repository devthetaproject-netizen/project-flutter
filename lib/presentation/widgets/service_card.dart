import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/models/mitra_model.dart';

class ServiceCard extends StatefulWidget {
  final MitraModel mitra;
  final VoidCallback? onTap;

  const ServiceCard({super.key, required this.mitra, this.onTap});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
            Expanded(child: _buildInfo()),
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
        widget.mitra.imagePath,
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

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopRow(),
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

  Widget _buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.mitra.providerName,
          style: const TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
        ),
        GestureDetector(
          onTap: _toggleBookmark,
          child: Icon(
            _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: const Color(0xFF007B7F),
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceName() {
    return Text(
      widget.mitra.serviceName,
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
      widget.mitra.price,
      style: const TextStyle(fontSize: 13, color: Colors.black54),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 4),
        Text(
          "${widget.mitra.rating} | ${widget.mitra.reviewCount} reviews",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
