import 'package:flutter/material.dart';

class WatchlistProvider extends ChangeNotifier {
  final List<String> _todos = [
    "Jaws",
    "Ant Man",
    "500 Days of Summer",
  ];

  List<String> get todos => _todos;

  void add(String todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
