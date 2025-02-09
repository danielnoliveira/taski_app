import 'package:taski_app/app/core/models/paginated_itens.dart';

abstract class ILocalService {
  Future<int> insertModel<T>(Map<String, dynamic> obj, String tableName);
  Future<List<T>> listModels<T>(
      String tableName, T Function(Map<String, dynamic>) parseObj);
  Future<List<T>> listModelsPaginated<T>(PaginatedItensParam param);
  Future<int> updateModel<T>(Map<String, dynamic> obj, String tableName);
  Future<int> deleteModel<T>(int id, String tableName);
  Future<int> deleteAllDoneTasks<T>(String tableName);
}
