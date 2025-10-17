import 'package:flutter/foundation.dart';

/// Minimal provider class used by the app. Expand as needed.
class AppProvider extends ChangeNotifier {
  // example state
  String _example = '';

  String get example => _example;

  void updateExample(String value) {
    _example = value;
    notifyListeners();
  }
}
