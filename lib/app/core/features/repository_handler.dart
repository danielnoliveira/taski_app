import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

Future<Result<T, Exception>> repositoryHandler<T extends Object>(
  Future<T> Function() action,
) async {
  try {
    var result = await action();
    return Result.success(result);
  } on DatabaseException catch (e) {
    return Result.failure(e);
  } catch (e) {
    return Result.failure(
        Exception(e.toString())); // Garante que sempre seja uma Exception
  }
}
