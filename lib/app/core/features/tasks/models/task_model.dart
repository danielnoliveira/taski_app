// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final bool done;

  TaskModel(
      {this.id,
      required this.title,
      required this.description,
      required this.done});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'done': done,
    };
  }

  Map<String, dynamic> toMapSqlite() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'done': done ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      done: map['done'] as bool,
    );
  }

  factory TaskModel.fromMapSqlite(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      done: (map['done'] as int) == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? done,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }
}
