import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/extensions/form_key_exts.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/helpers/modal_helper.dart';
import 'package:taski_app/app/core/helpers/snackbar_helper.dart';
import 'package:taski_app/app/core/helpers/validator_helper.dart';
import 'package:taski_app/app/core/utils/home_store_util.dart';
import 'package:taski_app/app/default_ui/taski_text_field.dart';
import 'package:taski_app/app/theme/app_colors.dart';
import 'package:taski_app/resources/resources.dart';

class CreateTaskModal extends StatefulWidget {
  const CreateTaskModal({super.key});

  @override
  State<CreateTaskModal> createState() => _CreateTaskModalState();
}

class _CreateTaskModalState extends HomeStoreStateFulWidget<CreateTaskModal> {
  ITasksRepository tasksRepository = Modular.get<ITasksRepository>();
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final titleFocus = FocusNode();
  final descriptionController = TextEditingController();
  final descriptionFocus = FocusNode();

  createTask() async {
    if (formKey.isFormInvalid) {
      return;
    }
    ModalHelper.createModalLoadingDialog(colorCircularLoading: AppColors.blue);
    final task = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      done: false,
    );
    await Future.delayed(1.seconds);
    var result = await tasksRepository.insertTask(task);
    Modular.to.pop();
    if (result.isSuccess()) {
      homeStore.pagingController.refresh();
      SnackBarHelper.showSuccessfulMessage('Task created successfully');
      Modular.to.pop();
    } else {
      SnackBarHelper.showErrorMessage('Failed to create task');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32)
              .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TaskiTextField(
                  textEditingController: titleController,
                  nextFocus: descriptionFocus,
                  focusNode: titleFocus,
                  validator: ValidatorHelper.isNotEmpty,
                  hintText: 'What’s in your mind?',
                  leftIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      Images.unchecked,
                      width: 12,
                      height: 12,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TaskiTextField(
                  hintText: 'Add a note...',
                  validator: ValidatorHelper.isNotEmpty,
                  textEditingController: descriptionController,
                  focusNode: descriptionFocus,
                  leftIcon: Icon(
                    Icons.edit,
                    color: AppColors.mutedAzure,
                    size: 5.2.w,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: createTask,
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        'Create',
                        style: TextStyle(
                          fontSize: 4.2.w,
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
