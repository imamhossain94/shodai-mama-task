import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/main_controller.dart';
import 'package:sizer/sizer.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ]),
      child: Obx(()=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIconButton(
              icon: FontAwesomeIcons.home,
              index: 0,
              onPressed: () {
                mainController.changeTab(0);
              }),
          if (![0, 1].contains(mainController.currentIndex.value))
            buildVerticalDivider(),
          buildTextButton(
              title: "Fresh",
              index: 1,
              onPressed: () {
                mainController.changeTab(1);
              }),
          if (![1, 2].contains(mainController.currentIndex.value))
            buildVerticalDivider(),
          buildTextButton(
              title: "Regular",
              index: 2,
              onPressed: () {
                mainController.changeTab(2);
              }),
          if (![2, 3].contains(mainController.currentIndex.value))
            buildVerticalDivider(),
          buildTextButton(
              title: "Preorder",
              index: 3,
              onPressed: () {
                mainController.changeTab(3);
              })
        ],
      )),
    );
  }

  Widget buildIconButton(
      {required IconData icon,
      required VoidCallback onPressed,
      required int index}) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            color: mainController.currentIndex.value == index
                ? const Color(0xFF00402F)
                : Colors.white,
            child: Icon(
              icon,
              size: 20.sp,
              color: mainController.currentIndex.value != index
                  ? const Color(0xFF00402F)
                  : Colors.white,
            ),
          ),
        ));
  }

  Widget buildTextButton(
      {required String title,
      required VoidCallback onPressed,
      required int index}) {
    return Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 3),
            color: mainController.currentIndex.value == index
                ? const Color(0xFF00402F)
                : Colors.white,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: mainController.currentIndex.value != index
                    ? const Color(0xFF00402F)
                    : Colors.white,
              ),
            ),
          ),
        ));
  }

  Widget buildVerticalDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.2.h),
      child: const VerticalDivider(
        width: 0.75,
        thickness: 1,
        color: Color(0xFF00402F),
      ),
    );
  }
}
