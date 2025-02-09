import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/default_ui/taski_loading.dart';
import 'package:taski_app/app/modules/home/subpages/todo_page/widgets/no_tasks_listed.dart';
import 'package:taski_app/app/modules/home/widgets/header.dart';
import 'package:taski_app/app/modules/home/widgets/opacity_bottom_cover.dart';
import 'package:taski_app/app/modules/home/widgets/task_card.dart';
import 'package:taski_app/app/modules/home/widgets/tasks_title_warning.dart';
import 'package:taski_app/app/modules/home/widgets/welcome_user.dart';

import 'todo_page_view_model.dart';

class TodoPageView extends TodoPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            WelcomeUser(),
            TasksTitleWarning(
              message: () {
                int? tasksCount = homeStore.pagingController.itemList?.length;
                if (tasksCount == null) {
                  return '';
                }
                if (tasksCount == 0) {
                  return 'Create tasks to achieve more.';
                }
                return 'You’ve got $tasksCount tasks to do.';
              }(),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  homeStore.pagingController.refresh();
                },
                child: PagedListView<int, TaskModel>(
                  pagingController: homeStore.pagingController,
                  padding:
                      EdgeInsets.symmetric(vertical: 32).copyWith(bottom: 16),
                  builderDelegate: PagedChildBuilderDelegate<TaskModel>(
                    firstPageProgressIndicatorBuilder: (context) {
                      return TaskiLoading();
                    },
                    newPageProgressIndicatorBuilder: (context) {
                      return TaskiLoading();
                    },
                    noItemsFoundIndicatorBuilder: (context) {
                      return const NoTasksListed();
                    },
                    itemBuilder: (context, item, index) => TaskCard(
                      task: item,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const OpacityBottomCover(),
      ],
    );
  }
}
