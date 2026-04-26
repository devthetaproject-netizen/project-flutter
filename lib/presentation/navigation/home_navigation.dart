import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/screens/all_services_page.dart';
import 'package:flutter_application_user/presentation/screens/bookmark_page.dart';
import 'package:flutter_application_user/presentation/screens/notification_page.dart';
import 'package:flutter_application_user/presentation/screens/promo_page.dart';
import 'package:flutter_application_user/presentation/screens/service_list_page.dart';

class HomeNavigation {
  static void toNotification(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  static void toBookmark(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookmarkPage()),
    );
  }

  static void toServiceList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServiceListPage()),
    );
  }

  static void toServiceListByCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceListPage(category: category),
      ),
    );
  }

  static void toPromo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PromoPage()),
    );
  }

  static void toSeeAllService(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AllServicesPage()),
    );
  }
}
