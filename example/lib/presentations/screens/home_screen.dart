import 'package:auto_lock/presentations/screens/settings_screen.dart';
import 'package:auto_lock/presentations/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, SettingsScreen.route()),
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            30,
            (index) => ListTile(
              onTap: () => Navigator.push(
                context,
                UserDetailScreen.route(index),
              ),
              title: Text(index.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
