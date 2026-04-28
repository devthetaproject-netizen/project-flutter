import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/navigation/detail_navigation.dart';
import 'package:flutter_application_user/presentation/navigation/home_navigation.dart';
import 'package:flutter_application_user/presentation/navigation/search_navigation.dart';
import 'package:flutter_application_user/presentation/state_mgmt/home_provider.dart';
import 'package:flutter_application_user/presentation/state_mgmt/user_provider.dart';
import 'package:flutter_application_user/presentation/widgets/banner_promo.dart';
import 'package:flutter_application_user/presentation/widgets/home_app_bar.dart';
import 'package:flutter_application_user/presentation/widgets/service_grid_widget.dart';
import 'package:flutter_application_user/presentation/widgets/section_header.dart';
import 'package:flutter_application_user/presentation/widgets/search_field.dart';
import 'package:flutter_application_user/presentation/widgets/service_card.dart';
import 'package:flutter_application_user/presentation/widgets/service_pill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final VoidCallback? onProfileTap;
  const HomePage({super.key, this.onProfileTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMitras = ref.watch(filteredMitraProvider);
    final greeting = ref.watch(greetingProvider);
    final userName = ref.watch(userNameProvider);
    final userImage = ref.watch(userImageProvider);

    return Scaffold(
      appBar: HomeAppBar(
        name: userName,
        greeting: greeting,
        imagePath: userImage,
        onProfileTap: onProfileTap,
        onNotificationTap: () => HomeNavigation.toNotification(context),
        onBookmarkTap: () => HomeNavigation.toBookmark(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchField(
              readOnly: true,
              onTap: () => SearchNavigation.toSearch(context),
            ),
            SectionHeader(
              title: 'Penawaran Khusus',
              onActionTap: () => HomeNavigation.toPromo(context),
            ),
            const BannerPromo(),
            const SizedBox(height: 8),
            SectionHeader(
              title: 'Layanan',
              onActionTap: () => HomeNavigation.toSeeAllService(context),
            ),
            const SizedBox(height: 8),
            const ServiceGridWidget(),
            SectionHeader(
              title: 'Most Popular Services',
              onActionTap: () => HomeNavigation.toServiceList(context),
            ),
            ServicePills(
              onSelected: (category) {
                ref.read(selectedCategoryProvider.notifier).state = category;
              },
            ),
            const SizedBox(height: 8),
            ...filteredMitras.map(
              (mitra) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ServiceCard(
                  mitra: mitra,
                  onTap: () => DetailNavigation.toDetail(context, mitra),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
