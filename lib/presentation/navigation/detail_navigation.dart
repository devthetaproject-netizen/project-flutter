import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/screens/detail_page.dart';
import '../../data/models/mitra_model.dart';

class DetailNavigation {
  static void toDetail(BuildContext context, MitraModel mitra) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(mitra: mitra)),
    );
  }
}
