import 'package:flutter/material.dart';

class PreorderTab  extends StatelessWidget  {
  const PreorderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Preorder Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}