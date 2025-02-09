import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taski_app/app/core/services/local/database_keys.dart';
import 'package:toastification/toastification.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

late Future<Database> database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), 'taski_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE ${DatabaseKeys.tasksTable}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT, done INTEGER DEFAULT 0)',
      );
    },
    version: 2,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ModularApp(
      module: AppModule(),
      child: const ToastificationWrapper(child: AppWidget())));
}
