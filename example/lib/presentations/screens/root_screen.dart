import 'package:flutter/material.dart';
import 'package:user_inactivity_detector/user_inactivity_detector.dart';

import '../services/auth_service.dart';

class RootScreen extends StatefulWidget {
  static route(Widget child) => MaterialPageRoute(
        builder: (context) => RootScreen(child: child),
      );

  final Widget child;

  const RootScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with WidgetsBindingObserver {
  late final AuthService service;
  bool isLock = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // This function listen app life cycle
    switch (state) {
      case AppLifecycleState.resumed:
        onAppResumed();
        break;
      case AppLifecycleState.paused:
        onAppPaused();
        break;
      case AppLifecycleState.detached:
        onAppDetached();
        break;
      case AppLifecycleState.inactive:
        onAppInactive();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    service = AuthService(
      text: 'Enter biometric data to enter app',
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void enableLock() => setState(() => isLock = true);

  void disableLock() => setState(() => isLock = false);

  void checkIsLock() async {
    if (isLock) {
      await service.auth();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkIsLock();
    return UserInactivityDetector(
      duration: const Duration(seconds: 3),
      onStopped: () async {
        await service.auth();
      },
      child: widget.child,
    );
  }

  void onAppResumed() {
    // This function will work if the application is resumed

    // your code here ...
    print('App is Resumed');
  }

  void onAppPaused() {
    // This function will work if the application is paused

    // your code here ...
    enableLock();
    print('App is Pause');
  }

  void onAppDetached() {
    // This function will work if the application is detached

    // your code here ...
    enableLock();
    print('App is Detached');
  }

  void onAppInactive() {
    // This function will work if the application is inactive

    // your code here ...
    print('App is Inactive');
  }
}
