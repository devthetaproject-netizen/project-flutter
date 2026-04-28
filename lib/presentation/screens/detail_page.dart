import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/models/mitra_model.dart';
import '../../data/models/review_model.dart';
import '../state_mgmt/bookmark_provider.dart';
import '../screens/booking_page.dart';

class DetailPage extends ConsumerStatefulWidget {
  final MitraModel mitra;

  const DetailPage({super.key, required this.mitra});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  final PageController _pageController = PageController();
  bool _isExpanded = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isBookmarked = ref.watch(isBookmarkedProvider(widget.mitra));

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCarousel(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleRow(isBookmarked),
                      const SizedBox(height: 8),
                      _buildProviderRow(),
                      const SizedBox(height: 8),
                      _buildCategoryAndAddress(),
                      const SizedBox(height: 16),
                      _buildPrice(),
                      const Divider(height: 32),
                      _buildAboutMe(),
                      const Divider(height: 32),
                      _buildPhotosSection(),
                      const Divider(height: 32),
                      _buildReviewSection(),
                      const SizedBox(height: 100), // space for bottom bar
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildBackButton(),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    final photos = widget.mitra.photos.isEmpty
        ? [widget.mitra.imagePath]
        : widget.mitra.photos;

    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Image.asset(
                photos[index],
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, _, _) => Container(
                  color: const Color(0xFFEEEEF5),
                  child: const Icon(
                    Icons.image_outlined,
                    size: 48,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: photos.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40,
      left: 16,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTitleRow(bool isBookmarked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.mitra.serviceName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => ref.read(bookmarkProvider.notifier).toggle(widget.mitra),
          child: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: const Color(0xFF007B7F),
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildProviderRow() {
    return Row(
      children: [
        Text(
          widget.mitra.providerName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF007B7F),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 4),
        Text(
          "${widget.mitra.rating} (${widget.mitra.reviewCount} reviews)",
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildCategoryAndAddress() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF007B7F).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            widget.mitra.category,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF007B7F),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            widget.mitra.address.isEmpty
                ? 'Alamat belum tersedia'
                : widget.mitra.address,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      children: [
        Text(
          widget.mitra.priceLabel,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '(Floor price)',
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About me',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          widget.mitra.description.isEmpty
              ? 'Deskripsi belum tersedia'
              : widget.mitra.description,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
          maxLines: _isExpanded ? null : 3,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        if (widget.mitra.description.isNotEmpty)
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Text(
              _isExpanded ? 'Read less...' : 'Read more...',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF007B7F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPhotosSection() {
    if (widget.mitra.photos.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos & Videos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.mitra.photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.mitra.photos[index],
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  color: const Color(0xFFEEEEF5),
                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildReviewSection() {
    if (widget.mitra.reviews.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  "${widget.mitra.rating} (${widget.mitra.reviewCount} reviews)",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007B7F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...widget.mitra.reviews.map((review) => _buildReviewItem(review)),
      ],
    );
  }

  Widget _buildReviewItem(ReviewModel review) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(review.reviewerImage),
                onBackgroundImageError: (_, _) {},
                backgroundColor: const Color(0xFFEEEEF5),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  review.reviewerName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      review.rating.toInt().toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.favorite_border,
                size: 16,
                color: Colors.black45,
              ),
              const SizedBox(width: 4),
              Text(
                '${review.likes}',
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(width: 16),
              Text(
                review.timeAgo,
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => debugPrint("Message tapped"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFF007B7F)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Message',
                  style: TextStyle(color: Color(0xFF007B7F)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007B7F),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
