import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeStore.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(ChildRoute(Modular.initialRoute,
        child: (_) => HomePage(),
        transition: TransitionType.leftToRightWithFade));
    super.routes(r);
  }
}
