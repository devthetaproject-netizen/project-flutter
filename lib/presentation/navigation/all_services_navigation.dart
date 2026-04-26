import 'package:flutter/material.dart';
import '../screens/service_list_page.dart';

class AllServicesNavigation {
  static void toServiceList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceListPage(category: category),
      ),
    );
  }
}
