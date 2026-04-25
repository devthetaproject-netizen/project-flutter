import 'package:flutter/material.dart';

import 'package:flutter_application_user/presentation/screens/promo_page.dart';

class HomeNavigation {
  gopromopage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PromoPage()),
    );
  }
}
