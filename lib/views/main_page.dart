import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/main_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }

}
