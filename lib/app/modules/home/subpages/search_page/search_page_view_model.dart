import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/mixins/automatic_search_mixin.dart';
import 'package:taski_app/app/core/models/paginated_itens.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';
import 'package:taski_app/app/modules/home/subpages/search_page/search_page.dart';

abstract class SearchPageViewModel extends State<SearchPage>
    with AutomaticSearchMixin {
  final pagingController = PagingController<int, TaskModel>(firstPageKey: 0);
  final searchController = TextEditingController();
  ITasksRepository tasksRepository = Modular.get<ITasksRepository>();

  @override
  void initState() {
    super.initState();
    automaticSearchPagingController = pagingController;
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  void removeTaskFromList(int taskId) {
    var tasks = (pagingController.itemList ?? <TaskModel>[]).toList();
    tasks.removeWhere(
      (element) => element.id == taskId,
    );
    pagingController.itemList = tasks;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      if (searchController.text.isEmpty) {
        pagingController.appendLastPage([]);
        return;
      }
      const pageSize = 10;
      var param = PaginatedItensParam<TaskModel>(
        parseObj: TaskModel.fromMapSqlite,
        tableName: DatabaseKeys.tasksTable,
        page: pageKey,
        pageSize: pageSize,
        searchText: searchController.text,
      );
      await Future.delayed(1.seconds);
      final result = await tasksRepository.listTasksPaginated(param);
      if (result.isError()) {
        pagingController.appendLastPage([]);
        // pagingController.error = result.exceptionOrNull();
        return;
      }
      var newItems = result.getOrThrow();
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
      if (mounted) {
        setState(() {});
      }
    } catch (error) {
      pagingController.appendLastPage([]);
    }
  }
}
