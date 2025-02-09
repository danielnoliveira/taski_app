class PaginatedItensParam<T> {
  final String tableName;
  final T Function(Map<String, dynamic>) parseObj;
  final int page;
  final int pageSize;
  final bool? done;
  final String? searchText;

  PaginatedItensParam({
    required this.tableName,
    required this.parseObj,
    this.page = 1,
    this.pageSize = 10,
    this.done,
    this.searchText,
  });
}
