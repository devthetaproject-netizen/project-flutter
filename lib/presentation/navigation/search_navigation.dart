import 'package:flutter/material.dart';
import '../screens/search_page.dart';

class SearchNavigation {
  static void toSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }
}
