import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/layanan_data.dart';
import '../../data/models/layanan_model.dart';

final layananProvider = Provider<List<LayananModel>>((ref) {
  return LayananData.services;
});
