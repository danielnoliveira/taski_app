import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/default_ui/taski_loading.dart';
import 'package:taski_app/app/modules/home/subpages/done_page/widgets/done_task_card.dart';
import 'package:taski_app/app/modules/home/subpages/search_page/search_page_view_model.dart';
import 'package:taski_app/app/modules/home/subpages/search_page/widgets/search_text_input.dart';
import 'package:taski_app/app/modules/home/subpages/todo_page/widgets/no_tasks_listed.dart';
import 'package:taski_app/app/modules/home/widgets/header.dart';
import 'package:taski_app/app/modules/home/widgets/task_card.dart';

class SearchPageView extends SearchPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Header(),
        SearchTextInput(
          onChangedAutomaticSearch: onChangedAutomaticSearch,
          textEditingController: searchController,
        ),
        Expanded(
          child: PagedListView<int, TaskModel>(
            pagingController: pagingController,
            padding: EdgeInsets.symmetric(vertical: 32).copyWith(bottom: 16),
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
              itemBuilder: (context, item, index) {
                if (item.done) {
                  return DoneTaskCard(
                      task: item, removeTask: removeTaskFromList);
                }
                return TaskCard(
                  task: item,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
