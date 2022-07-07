import 'package:flutter/material.dart';

import '../../service/timer_service.dart';

class TimerServiceProvider extends InheritedWidget {
  final TimerService service;

  const TimerServiceProvider({
    Key? key,
    required this.service,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // ignore: unrelated_type_equality_checks
    return service != oldWidget;
  }
}
