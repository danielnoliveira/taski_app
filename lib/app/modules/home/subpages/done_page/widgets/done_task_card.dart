import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/helpers/modal_helper.dart';
import 'package:taski_app/app/core/helpers/snackbar_helper.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';
import 'package:taski_app/app/modules/home/subpages/done_page/widgets/pale_done_checkbox.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class DoneTaskCard extends StatefulWidget {
  final TaskModel task;
  final void Function(int taskId) removeTask;
  const DoneTaskCard({super.key, required this.task, required this.removeTask});

  @override
  State<DoneTaskCard> createState() => _DoneTaskCardState();
}

class _DoneTaskCardState extends State<DoneTaskCard> {
  ITasksRepository tasksRepository = Modular.get<ITasksRepository>();

  TaskModel get task => widget.task;

  delete() async {
    try {
      ModalHelper.createModalLoadingDialog(
          colorCircularLoading: AppColors.blue);
      var deleteResult =
          await tasksRepository.deleteModel(task.id!, DatabaseKeys.tasksTable);
      Modular.to.pop();
      if (deleteResult.isSuccess()) {
        widget.removeTask(task.id!);
        SnackBarHelper.showSuccessfulMessage('Task deleted successfully');
      } else {
        SnackBarHelper.showErrorMessage('Failed to delete task');
      }
    } catch (e) {
      Modular.to.pop();
      SnackBarHelper.showErrorMessage('Failed to delete task');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: PaleDoneCheckbox(
                size: 28,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 4.5.w,
                      height: 1,
                      color: AppColors.stateBlue,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: delete,
              child: Icon(
                MdiIcons.delete,
                color: AppColors.fireRed,
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
