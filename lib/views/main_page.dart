import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/main_controller.dart';
import 'package:shodai_mama_task/views/tabs/fresh_tab.dart';
import 'package:shodai_mama_task/views/tabs/preorder_tab.dart';
import 'package:shodai_mama_task/views/tabs/regular_tab.dart';

import 'components/custom_bottom_nav_bar.dart';
import 'tabs/home_tab.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          "Geeks For Geeks",
        ),
        titleSpacing: 0,
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.ten_k),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }


  Widget getBody() {
    List<Widget> pages = [
      const HomeTab(),
      const FreshTab(),
      const RegularTab(),
      const PreorderTab(),
    ];
    return Obx(() => IndexedStack(
      index: mainController.currentIndex.value,
      children: pages,
    ));
  }

}


