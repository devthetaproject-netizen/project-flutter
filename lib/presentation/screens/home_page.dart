import 'package:flutter/material.dart';
import 'package:flutter_application_user/data/datasources/mitra_data.dart';
import 'package:flutter_application_user/data/datasources/user_data.dart';
import 'package:flutter_application_user/data/models/mitra_model.dart';
import 'package:flutter_application_user/domain/navigation/home.dart';
import 'package:flutter_application_user/presentation/screens/bookmark_page.dart';
import 'package:flutter_application_user/presentation/screens/notifikasi_page.dart';
import 'package:flutter_application_user/presentation/screens/see_layanan_page.dart';
import 'package:flutter_application_user/presentation/screens/see_all_page.dart';
import 'package:flutter_application_user/presentation/widgets/bannerpromo.dart';
import 'package:flutter_application_user/presentation/widgets/berandaappbar.dart';
import 'package:flutter_application_user/presentation/widgets/layanan_widget.dart';
import 'package:flutter_application_user/presentation/widgets/seactionheader.dart';
import 'package:flutter_application_user/presentation/widgets/searchfield.dart';
import 'package:flutter_application_user/presentation/widgets/service_card.dart';
import 'package:flutter_application_user/presentation/widgets/servicepill.dart';

class HomePages extends StatefulWidget {
  final VoidCallback? onProfileTap;

  const HomePages({super.key, this.onProfileTap});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var homeNav = HomeNavigation();
  String _selectedCategory = 'All';
  List<MitraModel> get _filteredMitras {
    if (_selectedCategory == 'All') return MitraData.mitras;
    return MitraData.mitras
        .where((m) => m.category == _selectedCategory)
        .toList();
  }

  void _onNotificationTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotifikasiPage()),
    );
  }

  void _onBookmarkTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookmarkPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BerandaAppBar(
        name: UserData.currentUser.name,
        greeting: "Selamat Pagi 👋",
        imagePath: UserData.currentUser.imagePath,
        onProfileTap: widget.onProfileTap,
        onNotificationTap: _onNotificationTap,
        onBookmarkTap: _onBookmarkTap,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchField(
              onChanged: (value) {
                debugPrint("Search: $value");
              },
              onTap: () {
                debugPrint("Search tapped");
              },
            ),
            const SizedBox(height: 8), //ini jarak antar widget
            SectionHeader(
              title: 'Penawaran Khusus',
              onActionTap: () => homeNav.gopromopage(context),
            ),
            const SizedBox(height: 8),
            const BannerPromo(),
            const SizedBox(height: 8),
            SectionHeader(
              title: 'Layanan',
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeeLayananPage(),
                  ),
                );
              },
            ),
            LayananWidget(
              onTap: (service) {
                debugPrint("Tapped: ${service.label}");
              },
            ),
            const SizedBox(height: 8),
            SectionHeader(
              title: 'Most Popular Services',
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SeeAllPage()),
                );
              },
            ),
            const SizedBox(height: 8),
            ServicePills(
              onSelected: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
            const SizedBox(height: 16),
            ..._filteredMitras.map(
              (mitra) => Padding(
                // ← pakai filtered
                padding: const EdgeInsets.only(bottom: 12),
                child: ServiceCard(
                  mitra: mitra,
                  onTap: () {
                    debugPrint("Tapped: ${mitra.serviceName}");
                  },
                ),
              ),
            ),
            // isi konten
          ],
        ),
      ),
    );
  }
}
