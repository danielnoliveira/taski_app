import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import 'theme/default_theme.dart';

final navKey = GlobalKey<NavigatorState>();

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(navKey);
    return Sizer(
      builder: (p0, p1, p2) {
        debugPrint(p1.name);
        debugPrint(p2.name);
        return MaterialApp.router(
          title: 'Taski App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: appTheme,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
