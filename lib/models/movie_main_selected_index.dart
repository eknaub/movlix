import 'package:flutter/material.dart';

class MovieMainSelectedIndexProvider with ChangeNotifier {
  int _selectedMenuIndex = -1;
  int _selectedLibraryIndex = -1;
  int _selectedGeneralIndex = 0;

  int get selectedMenuIndex => _selectedMenuIndex;
  int get selectedLibraryIndex => _selectedLibraryIndex;
  int get selectedGeneralIndex => _selectedGeneralIndex;

  void updateMenuIndex(int index) {
    _selectedMenuIndex = index;
    _selectedLibraryIndex = -1;
    _selectedGeneralIndex = -1;
    notifyListeners();
  }

  void updateLibraryIndex(int index) {
    _selectedMenuIndex = -1;
    _selectedLibraryIndex = index;
    _selectedGeneralIndex = -1;
    notifyListeners();
  }

  void updateGeneralIndex(int index) {
    _selectedMenuIndex = -1;
    _selectedLibraryIndex = -1;
    _selectedGeneralIndex = index;
    notifyListeners();
  }
}
