import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin AutomaticSearchMixin {
  late PagingController automaticSearchPagingController;
  final textSearchAwaitDuration = const Duration(milliseconds: 1000);

  Timer? t;
  String lastTextSearched = "";

  void onChangedAutomaticSearch(String text) {
    t?.cancel();
    t = Timer(textSearchAwaitDuration, () => reloadList(text));
  }

  void reloadList(String text) {
    if (text == lastTextSearched) {
      return;
    }
    lastTextSearched = text;
    automaticSearchPagingController.refresh();
  }
}
