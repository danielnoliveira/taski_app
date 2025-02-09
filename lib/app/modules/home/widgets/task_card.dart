import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';
import 'package:taski_app/app/default_ui/taski_checkbox.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  ITasksRepository tasksRepository = Modular.get<ITasksRepository>();
  bool isDone = false;
  bool showDescription = false;

  @override
  void initState() {
    super.initState();
    isDone = task.done;
  }

  toggleShowDescription() {
    if (mounted) {
      setState(() {
        showDescription = !showDescription;
      });
    }
  }

  updateFlag() {
    if (mounted) {
      setState(() {
        isDone = !isDone;
      });
    }
  }

  toggleDone() {
    updateFlag();
    var taskClone = task.copyWith(done: isDone);
    tasksRepository
        .updateModel(taskClone.toMapSqlite(), DatabaseKeys.tasksTable)
        .then(
      (value) {
        if (value.isError()) {
          updateFlag();
        }
      },
    ).catchError((e) {
      updateFlag();
    });
  }

  TaskModel get task => widget.task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: toggleShowDescription,
        behavior: HitTestBehavior.opaque,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.paleWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: toggleDone,
                  behavior: HitTestBehavior.opaque,
                  child: TaskiCheckbox(
                    isChecked: isDone,
                    size: 28,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        task.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 4.5.w,
                          color: AppColors.statePurple,
                          decoration:
                              isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                    if (showDescription)
                      Text(
                        task.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 3.7.w,
                          color: AppColors.stateBlue,
                          height: 18 / 14,
                          decoration:
                              isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                  ],
                ),
              ),
              if (!showDescription)
                Icon(
                  MdiIcons.dotsHorizontal,
                  color: AppColors.mutedAzure,
                  size: 32,
                )
            ],
          ),
        ),
      ),
    );
  }
}
