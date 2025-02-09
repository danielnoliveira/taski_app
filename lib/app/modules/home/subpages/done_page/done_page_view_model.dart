import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/helpers/modal_helper.dart';
import 'package:taski_app/app/core/helpers/snackbar_helper.dart';
import 'package:taski_app/app/core/models/paginated_itens.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';
import 'package:taski_app/app/modules/home/subpages/done_page/done_page.dart';
import 'package:taski_app/app/theme/app_colors.dart';

abstract class DonePageViewModel extends State<DonePage> {
  ITasksRepository tasksRepository = Modular.get<ITasksRepository>();

  PagingController<int, TaskModel> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();

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

  deleteEveryTask() async {
    try {
      ModalHelper.createModalLoadingDialog(
          colorCircularLoading: AppColors.blue);
      var deletesResult =
          await tasksRepository.deleteAllDoneTasks(DatabaseKeys.tasksTable);
      Modular.to.pop();
      if (deletesResult.isSuccess()) {
        pagingController.refresh();
        SnackBarHelper.showSuccessfulMessage('All tasks deleted successfully');
      } else {
        SnackBarHelper.showErrorMessage('Failed to delete all tasks');
      }
    } catch (e) {
      Modular.to.pop();
      SnackBarHelper.showErrorMessage('Failed to delete all tasks');
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      const pageSize = 10;
      var param = PaginatedItensParam<TaskModel>(
        parseObj: TaskModel.fromMapSqlite,
        tableName: DatabaseKeys.tasksTable,
        page: pageKey,
        pageSize: pageSize,
        done: true,
      );
      await Future.delayed(1.seconds);
      final result = await tasksRepository.listTasksPaginated(param);
      if (result.isError()) {
        pagingController.error = result.exceptionOrNull();
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
      setState(() {});
    } catch (error) {
      pagingController.error = error;
    }
  }
}
