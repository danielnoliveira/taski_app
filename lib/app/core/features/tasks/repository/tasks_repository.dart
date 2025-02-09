// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:result_dart/result_dart.dart';
import 'package:taski_app/app/core/features/repository_handler.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/models/paginated_itens.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';

class TasksRepository extends ITasksRepository {
  TasksRepository({required super.localService});

  @override
  Future<Result<int, Exception>> insertTask(TaskModel task) async {
    return repositoryHandler<int>(
      () =>
          localService.insertModel(task.toMapSqlite(), DatabaseKeys.tasksTable),
    );
  }

  @override
  Future<Result<List<TaskModel>, Exception>> listTasksPaginated(
      PaginatedItensParam param) async {
    return repositoryHandler<List<TaskModel>>(
      () => localService.listModelsPaginated(param),
    );
  }

  @override
  Future<Result<int, Exception>> updateModel<T>(
      Map<String, dynamic> obj, String tableName) async {
    return repositoryHandler<int>(
      () => localService.updateModel(obj, tableName),
    );
  }

  @override
  Future<Result<int, Exception>> deleteModel<T>(
      int id, String tableName) async {
    return repositoryHandler<int>(
      () => localService.deleteModel(id, tableName),
    );
  }

  @override
  Future<Result<int, Exception>> deleteAllDoneTasks<T>(String tableName) async {
    return repositoryHandler<int>(
      () => localService.deleteAllDoneTasks(tableName),
    );
  }
}
