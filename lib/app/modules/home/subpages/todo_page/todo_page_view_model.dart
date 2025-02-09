import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/models/paginated_itens.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';
import 'package:taski_app/app/core/utils/home_store_util.dart';
import 'package:taski_app/app/modules/home/subpages/todo_page/todo_page.dart';

abstract class TodoPageViewModel extends HomeStoreStateFulWidget<TodoPage> {
  ITasksRepository tasksRepository = Modular.get<ITasksRepository>();

  @override
  void initState() {
    super.initState();
    homeStore.pagingController = PagingController(firstPageKey: 0);
    homeStore.pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    homeStore.pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      const pageSize = 10;
      var param = PaginatedItensParam<TaskModel>(
        parseObj: TaskModel.fromMapSqlite,
        tableName: DatabaseKeys.tasksTable,
        page: pageKey,
        pageSize: pageSize,
        done: false,
      );
      await Future.delayed(1.seconds);
      final result = await tasksRepository.listTasksPaginated(param);
      if (result.isError()) {
        homeStore.pagingController.error = result.exceptionOrNull();
        return;
      }
      var newItems = result.getOrThrow();
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        homeStore.pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        homeStore.pagingController.appendPage(newItems, nextPageKey);
      }
      if (mounted) {
        setState(() {});
      }
    } catch (error) {
      homeStore.pagingController.error = error;
    }
  }
}
