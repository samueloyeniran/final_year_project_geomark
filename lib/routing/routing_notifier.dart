import 'package:flutter/widgets.dart';

class RoutingNotifier extends ChangeNotifier {
  RoutingNotifier._();
  static final RoutingNotifier _instance = RoutingNotifier._();
  factory RoutingNotifier() => _instance;

  void refresh() {
    notifyListeners();
  }
}
