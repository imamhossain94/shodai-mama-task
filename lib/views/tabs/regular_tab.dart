import 'package:flutter/material.dart';

class RegularTab  extends StatelessWidget  {
  const RegularTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Regular Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}