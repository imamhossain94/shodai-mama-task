import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/main_controller.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIconButton(icon: FontAwesomeIcons.home, index: 0, onPressed: () {
            mainController.changeTab(0);
          }),
          buildTextButton(title: "Fresh", index: 1, onPressed: (){
            mainController.changeTab(1);
          }),
          buildTextButton(title: "Regular", index: 2, onPressed: (){
            mainController.changeTab(2);
          }),
          buildTextButton(title: "Preorder", index: 3, onPressed: (){
            mainController.changeTab(3);
          })
        ],
      ),
    );
  }

  Widget buildIconButton(
      {required IconData icon, required VoidCallback onPressed, required int index}) {
    return Expanded(
        flex: 1,
        child: Obx(()=>GestureDetector(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            color: mainController.currentIndex.value == index
                ? Theme.of(context).primaryColor
                : Colors.white,
            child: Icon(
              icon,
              color: mainController.currentIndex.value != index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
            ),
          ),
        )));
  }

  Widget buildTextButton(
      {required String title,
      required VoidCallback onPressed,
      required int index}) {
    return Expanded(
        flex: 2,
        child: Obx(()=>GestureDetector(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            color: mainController.currentIndex.value == index
                ? Theme.of(context).primaryColor
                : Colors.white,
            child: Text(
              title,
              style: TextStyle(
                color:  mainController.currentIndex.value != index
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
            ),
          ),
        )));
  }
}
