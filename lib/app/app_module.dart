import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski_app/app/core/features/tasks/repository/i_tasks_repository.dart';
import 'package:taski_app/app/core/features/tasks/repository/tasks_repository.dart';
import 'package:taski_app/app/core/services/local/i_local_service.dart';
import 'package:taski_app/app/core/services/local/sqlite_local_service.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ILocalService>(SqliteLocalService.new);
    i.addLazySingleton<ITasksRepository>(TasksRepository.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(ModuleRoute('/', module: AuthModule()));
    r.add(ModuleRoute('/home', module: HomeModule()));
    super.routes(r);
  }
}
