import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski_app/app/core/enums/bottom_nav_page_type.dart';
import 'package:taski_app/app/core/utils/home_store_util.dart';
import 'package:taski_app/app/modules/home/subpages/done_page/done_page.dart';
import 'package:taski_app/app/modules/home/subpages/search_page/search_page.dart';
import 'package:taski_app/app/modules/home/subpages/todo_page/todo_page.dart';
import 'package:taski_app/app/modules/home/widgets/bottom_navigation_bar.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'Home'});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends HomeStoreStateFulWidget<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Observer(builder: (context) {
          return SafeArea(child: () {
            switch (homeStore.bottomNavPageType) {
              case BottomNavPageType.todo:
                return TodoPage();
              case BottomNavPageType.create:
                return const SizedBox();
              case BottomNavPageType.search:
                return SearchPage();
              case BottomNavPageType.done:
                return DonePage();
            }
          }());
        }),
        bottomNavigationBar: TaskiBottomNavigationBar(),
      ),
    );
  }
}
