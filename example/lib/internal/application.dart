import 'package:flutter/material.dart';
import 'package:user_inactivity_detector/service/timer_service.dart';
import 'package:user_inactivity_detector/service/timer_service_provider.dart';

import '../presentations/screens/home_screen.dart';
import '../presentations/screens/root_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimerServiceProvider(
      service: TimerService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootScreen(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
