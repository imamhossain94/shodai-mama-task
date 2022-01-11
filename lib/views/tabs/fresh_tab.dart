import 'package:flutter/material.dart';

class FreshTab  extends StatelessWidget  {
  const FreshTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Fresh Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}