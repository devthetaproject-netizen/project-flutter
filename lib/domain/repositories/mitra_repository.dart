import '../../data/models/mitra_model.dart';

abstract class MitraRepository {
  List<MitraModel> search(String query);
}
