import 'package:flutter_modular/flutter_modular.dart';

class RouteManager {
  static goToHome() {
    Modular.to.popAndPushNamed('/home/');
  }
}
