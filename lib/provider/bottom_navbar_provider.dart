import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _currentPage = 0;

  setCurrentPage(cPage) {
    _currentPage = cPage;
    notifyListeners();
  }

  get currentPage => _currentPage;
}
