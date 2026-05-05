import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/call_data.dart';
import '../../data/models/call_model.dart';

final callProvider = Provider<List<CallModel>>((ref) {
  return CallData.calls;
});
