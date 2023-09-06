import 'package:flutter/material.dart';

class SelectedMovieBloc extends ChangeNotifier {
  String? get movieName => _movieName;
  String? _movieName;

  void setMovieName(String? name) {
    _movieName = name;
    notifyListeners();
  }
}
