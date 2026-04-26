import '../../data/datasources/mitra_data.dart';
import '../../data/models/mitra_model.dart';
import '../../domain/repositories/mitra_repository.dart';

class LocalMitraRepository implements MitraRepository {
  @override
  List<MitraModel> search(String query) {
    if (query.isEmpty) return MitraData.mitras;
    return MitraData.mitras
        .where((m) => m.serviceName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
