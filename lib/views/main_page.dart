import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/cart_controller.dart';
import 'package:shodai_mama_task/controllers/home_tab_controller.dart';
import 'package:shodai_mama_task/controllers/main_controller.dart';
import 'package:shodai_mama_task/views/components/custom_floating_action_button.dart';
import 'package:shodai_mama_task/views/tabs/fresh_tab.dart';
import 'package:shodai_mama_task/views/tabs/preorder_tab.dart';
import 'package:shodai_mama_task/views/tabs/regular_tab.dart';

import 'components/custom_bottom_nav_bar.dart';
import 'tabs/home_tab.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());
  final cartController = Get.put(CartController());
  final homeTabController = Get.put(HomeTabController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: Obx(()=>Text(
          getAppBarTitle() ,
        )),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.search, size: 20,)),
          shoppingCartBadge()
        ],
      ),
      body: getBody(),
      floatingActionButton: Obx(()=>Opacity(
          opacity: homeTabController.isScrolled.value?0:1,
          child: CustomFloatingActionButton()
      )),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  String getAppBarTitle() {
    return [
      "Home",
      "Fresh",
      "Regular",
      "Preorder"
    ][mainController.currentIndex.value];
  }

  Widget getBody() {
    List<Widget> pages = [
      HomeTab(),
      const FreshTab(),
      const RegularTab(),
      const PreorderTab(),
    ];
    return Obx(() => IndexedStack(
          index: mainController.currentIndex.value,
          children: pages,
        ));
  }


  Widget shoppingCartBadge() {
    return Obx(()=> cartController.count > 0?Badge(
      position: BadgePosition.topEnd(top: 5, end: 3),
      animationDuration: const Duration(milliseconds: 100),
      animationType: BadgeAnimationType.scale,
      shape: BadgeShape.circle,
      badgeContent: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Text(
          cartController.count.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
    ):IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}));
  }


}
