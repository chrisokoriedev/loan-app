import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String username;
  const Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Text("hello $username"),
      ),
    );
  }
}
