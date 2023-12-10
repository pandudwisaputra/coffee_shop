import 'package:flutter/material.dart';

class MapProvider with ChangeNotifier {
  bool _isMapReady = false;

  bool get isMapReady => _isMapReady;

  setIsMapReady(bool isMapReady) {
    _isMapReady = isMapReady;
    notifyListeners();
  }
}
