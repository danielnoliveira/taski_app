import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:taski_app/app/core/enums/bottom_nav_page_type.dart';
import 'package:taski_app/app/core/features/tasks/models/task_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  BottomNavPageType bottomNavPageType = BottomNavPageType.todo;

  @action
  setBottomNavPageType(BottomNavPageType value) {
    bottomNavPageType = value;
  }

  PagingController<int, TaskModel> pagingController =
      PagingController(firstPageKey: 0);
}
