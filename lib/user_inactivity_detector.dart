library user_inactivity_detector;

import 'package:flutter/material.dart';

import 'service/timer_service.dart';

class UserInactivityDetector extends StatefulWidget {
  // This plugin is needed to find out that the user does not touch the device for a certain time

  // Time after expiration the function ( onStopped ) will be called
  final Duration duration;
  // The function will be executed as a result of user inactivity again after the specified time
  final Function() onStopped;
  // Flag to disable or enable the function ( onStopped ) (can be disabled to save CPU memory and free up the thread)
  final bool enabled;
  // This is a mandatory parameter a widget is passed here to track it
  final Widget? child;

  const UserInactivityDetector({
    Key? key,
    this.child,
    required this.duration,
    required this.onStopped,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<UserInactivityDetector> createState() => _UserInactivityDetectorState();
}

class _UserInactivityDetectorState extends State<UserInactivityDetector> {
  TimerService? _timerService;

  @override
  Widget build(BuildContext context) {
    initService();
    return GestureDetector(
      onTap: _userInteraction,
      onDoubleTap: _userInteraction,
      onSecondaryLongPress: _userInteraction,
      onScaleStart: _userInteraction,
      onDoubleTapCancel: _userInteraction,
      onLongPress: _userInteraction,
      onTapDown: _userInteraction,
      onLongPressDown: _userInteraction,
      onLongPressStart: _userInteraction,
      onLongPressEnd: _userInteraction,
      onForcePressStart: _userInteraction,
      onForcePressEnd: _userInteraction,
      onForcePressPeak: _userInteraction,
      onForcePressUpdate: _userInteraction,
      onVerticalDragDown: _userInteraction,
      onHorizontalDragCancel: _userInteraction,
      onScaleUpdate: _userInteraction,
      onSecondaryTap: _userInteraction,
      onLongPressMoveUpdate: _userInteraction,
      child: widget.child,
    );
  }

  void initService() {
    if (_timerService == null) {
      _timerService = TimerService.of(context);
      _timerService!.setCurrentDuration(widget.duration);
      _timerService!.start();
      _timerService!.addListener(() {
        if (widget.enabled) {
          _handleTimerService();
        }
      });
    }
  }

  void _userInteraction([_]) => _timerService!.reset();

  void _handleTimerService() => widget.onStopped();
}
