import 'package:sqflite/sql.dart';
import 'package:taski_app/app/core/models/paginated_itens.dart';
import 'package:taski_app/app/core/services/local/i_local_service.dart';
import 'package:taski_app/main.dart';

class SqliteLocalService extends ILocalService {
  @override
  Future<int> insertModel<T>(Map<String, dynamic> obj, String tableName) async {
    final db = await database;

    return await db.insert(tableName, obj,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<T>> listModels<T>(
      String tableName, T Function(Map<String, dynamic> p1) parseObj) async {
    final db = await database;

    final List<Map<String, Object?>> objMaps = await db.query(tableName);

    return objMaps.map(parseObj).toList();
  }

  @override
  Future<int> updateModel<T>(Map<String, dynamic> obj, String tableName) async {
    final db = await database;

    return await db.update(
      tableName,
      obj,
      where: 'id = ?',
      whereArgs: [obj['id'] as int],
    );
  }

  @override
  Future<int> deleteModel<T>(int id, String tableName) async {
    final db = await database;

    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<T>> listModelsPaginated<T>(PaginatedItensParam param) async {
    final db = await database;

    final offset = (param.page - 1) * param.pageSize;

    String whereClause = "";
    List<Object?> whereArgs = [];
    if (param.done != null) {
      whereClause += "done = ?";
      whereArgs.add(param.done! ? 1 : 0);
    }
    if (param.searchText != null) {
      if (whereClause.isNotEmpty) {
        whereClause += " AND ";
      }
      whereClause += "title LIKE ? OR description LIKE ?";
      String searchPattern = "%${param.searchText!}%";
      whereArgs.add(searchPattern);
      whereArgs.add(searchPattern);
    }

    final List<Map<String, Object?>> objMaps = await db.query(
      param.tableName,
      limit: param.pageSize,
      offset: offset,
      where: whereClause.isEmpty ? null : whereClause,
      whereArgs: whereArgs.isEmpty ? null : whereArgs,
    );

    return objMaps.map(param.parseObj).toList().cast<T>();
  }

  @override
  Future<int> deleteAllDoneTasks<T>(String tableName) async {
    final db = await database;

    return await db.delete(
      tableName,
      where: 'done = ?',
      whereArgs: [1],
    );
  }
}
