import 'package:flutter/material.dart';
import '../screens/service_list_page.dart';
import '../screens/all_services_page.dart';

class ServiceGridNavigation {
  static void toServiceList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceListPage(category: category),
      ),
    );
  }

  static void toAllServices(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AllServicesPage()),
    );
  }
}
