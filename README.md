# User inactivity detector

User inactivity detector reacts to user inactivity

*For example you have a banking application and you need to lock the device after the expiration date for example 30 seconds this plugin solves your problem*

# Overview of parameters

Duration `duration` the delay after which the `onStopped` function will be executed.

Function `onStopped` will be executed when the user is inactive.

bool `enabled` this is a flag if its value is `true`, everything works if it is `false`, then the function stops working

*for example, you can disable after execution*


## Usage

**initialize**

You need to provide it to the root widget

like bellow

```dart
import 'package:flutter/material.dart';
import 'package:user_inactivity_detector/service/timer_service.dart';
import 'package:user_inactivity_detector/service/timer_service_provider.dart';

class MyApp extends StatelessWidget {  
  const MyApp({Key? key}) : super(key: key);  
  
  @override  
 Widget build(BuildContext context) {  
    return TimerServiceProvider(  
      service: TimerService(),  
      child: MaterialApp(  
        title: 'Flutter Smart Detector',  
        theme: ThemeData(  
          primarySwatch: Colors.blue,  
        ),  
        home: YourHome(),
      ),  
    );  
  }  
}

```

**Example Usage**

The **onStopped** function will trigger when the user is idle with a delay of 2 seconds

````dart
import 'package:flutter/material.dart';
import 'package:user_inactivity_detector/user_inactivity_detector.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInactivityDetector(
        duration: const Duration(seconds: 2),
        onStopped: () {
          print('stopped');
        },
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              30,
                  (index) => ListTile(
                title: Text(index.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```` 

©Copyright 2022