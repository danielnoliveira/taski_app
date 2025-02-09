import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski_app/app/modules/home/home_store.dart';

abstract class HomeStoreStateFulWidget<T extends StatefulWidget>
    extends State<T> {
  HomeStore homeStore = Modular.get<HomeStore>();
}
