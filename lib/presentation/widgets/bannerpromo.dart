import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerPromo extends StatefulWidget {
  const BannerPromo({super.key});

  @override
  State<BannerPromo> createState() => _BannerPromoState();
}

class _BannerPromoState extends State<BannerPromo> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _banners = [
    {
      'title': 'Diskon 50%',
      'subtitle': 'Servis AC pertama kamu!',
      'color': const Color(0xFF007B7F),
    },
    {
      'title': 'Laundry Kilat',
      'subtitle': 'Selesai dalam 3 jam!',
      'color': const Color(0xFF0099A8),
    },
    {
      'title': 'Bersih Maksimal',
      'subtitle': 'Cleaning service profesional',
      'color': const Color(0xFF005F63),
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarousel(),
        const SizedBox(height: 8),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _banners.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return _buildBannerItem(_banners[index]);
        },
      ),
    );
  }

  Widget _buildBannerItem(Map<String, dynamic> banner) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: banner['color'],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            banner['title'],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            banner['subtitle'],
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentIndex,
      count: _banners.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Color(0xFF007B7F),
        dotColor: Color(0xFFCCCCCC),
        dotHeight: 8,
        dotWidth: 8,
        expansionFactor: 3,
      ),
    );
  }
}
