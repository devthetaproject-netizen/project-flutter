import 'package:flutter/material.dart';
import '../screens/bookmark_page.dart';

class BookmarkNavigation {
  static void toBookmark(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookmarkPage()),
    );
  }
}
