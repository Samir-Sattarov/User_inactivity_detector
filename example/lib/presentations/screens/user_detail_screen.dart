import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  static route(int id) => MaterialPageRoute(
        builder: (context) => UserDetailScreen(id: id),
      );
  final int id;
  const UserDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
      ),
      body: Center(
        child: Text('User id: $id'),
      ),
    );
  }
}
