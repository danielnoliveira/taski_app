// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:result_dart/result_dart.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/models/paginated_itens.dart';
import 'package:taski_app/app/core/services/local/i_local_service.dart';

abstract class ITasksRepository {
  final ILocalService localService;

  ITasksRepository({
    required this.localService,
  });

  Future<Result<int, Exception>> insertTask(TaskModel task);
  Future<Result<List<TaskModel>, Exception>> listTasksPaginated(
      PaginatedItensParam param);
  Future<Result<int, Exception>> updateModel<T>(
      Map<String, dynamic> obj, String tableName);
  Future<Result<int, Exception>> deleteModel<T>(int id, String tableName);
  Future<Result<int, Exception>> deleteAllDoneTasks<T>(String tableName);
}
