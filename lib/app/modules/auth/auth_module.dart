// ignore_for_file: unnecessary_overrides

import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski_app/app/modules/auth/pages/splash/splash_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(ChildRoute(Modular.initialRoute, child: (_) => SplashPage()));
    super.routes(r);
  }
}
