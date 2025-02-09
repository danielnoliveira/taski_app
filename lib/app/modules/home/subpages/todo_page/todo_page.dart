import 'package:flutter/material.dart';

import 'todo_page_view.dart';
import 'todo_page_view_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  TodoPageViewModel createState() => TodoPageView();
}
