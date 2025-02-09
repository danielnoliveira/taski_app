import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/default_ui/taski_loading.dart';
import 'package:taski_app/app/modules/home/subpages/done_page/widgets/done_task_card.dart';
import 'package:taski_app/app/modules/home/subpages/todo_page/widgets/no_tasks_listed.dart';
import 'package:taski_app/app/modules/home/widgets/header.dart';
import 'package:taski_app/app/modules/home/widgets/opacity_bottom_cover.dart';

import 'done_page_view_model.dart';
import 'widgets/done_page_header.dart';

class DonePageView extends DonePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(),
            DoneListHeader(
              deleteEveryTask: deleteEveryTask,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  pagingController.refresh();
                },
                child: PagedListView<int, TaskModel>(
                  pagingController: pagingController,
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
                      return NoTasksListed(
                        showCreateTaskButton: false,
                      );
                    },
                    itemBuilder: (context, item, index) => DoneTaskCard(
                      removeTask: removeTaskFromList,
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
