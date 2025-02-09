import 'package:taski_app/resources/resources.dart';

enum BottomNavPageType {
  todo(icon: Images.todo, name: 'Todo'),
  create(icon: Images.plus, name: 'Create'),
  search(icon: Images.searchAlt, name: 'Search'),
  done(icon: Images.checked, name: 'Done');

  final String icon;
  final String name;

  const BottomNavPageType({required this.icon, required this.name});
}
