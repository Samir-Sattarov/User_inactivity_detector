import 'dart:async';

import 'package:flutter/material.dart';

import 'timer_service_provider.dart';

class TimerService extends ChangeNotifier {
  // Timer Service
  // The usual timer
  Timer? _timer;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _timer != null;

  void setCurrentDuration(Duration duration) {
    // Set duration from constructor
    _currentDuration = duration;
  }

  void _logOut(Timer timer) {
    // Triggered when the timer expires
    stop();
    notifyListeners();
  }

  void start() {
    if (_timer != null) return;

    _timer = Timer.periodic(
      _currentDuration,
      _logOut,
    );
  }

  void stop() {
    // Stop timer
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    // Reset Timer
    stop();
    start();
  }

  static TimerService of(BuildContext context) {
    // Provide
    final TimerServiceProvider? provider =
        context.dependOnInheritedWidgetOfExactType<TimerServiceProvider>();
    return provider?.service ?? TimerService();
  }
}
