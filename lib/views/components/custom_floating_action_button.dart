import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/cart_controller.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  // double containerWidth = 50.0;
  // bool isCollapse = true;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          height: 50,
          width: cartController.containerWidth.value,
          curve: Curves.fastLinearToSlowEaseIn,
          child: collapseButton(
              icon: FontAwesomeIcons.shoppingCart,
              onPressed: () {
                cartController.updateWidth();
              }),
          duration: const Duration(milliseconds: 200),
          onEnd: () {
            cartController.updateContainerState();
          },
        ));
  }

  Widget collapseButton(
      {required VoidCallback onPressed, required IconData icon}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: cartController.containerWidth.value,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: !cartController.isCollapse.value
                ? Colors.white
                : const Color(0xFF00402F),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color(0xFF00402F), width: 2.0)),
        alignment: Alignment.center,
        child: cartController.isCollapse.value
            ? Icon(
                icon,
                size: 18,
                color: Colors.white,
              )
            : Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "Items: ${cartController.count}",
                        style: const TextStyle(color: Color(0xFF00402F)),
                      ),
                      Text(
                        "Total: ৳${cartController.totalPrice}",
                        style: const TextStyle(color: Color(0xFF00402F)),
                      )
                    ],
                  )),
                  const VerticalDivider(
                    thickness: 2,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFF00402F),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "PLACE ORDER",
                          style: TextStyle(color: Colors.white),
                        )),
                  ))
                ],
              ),
      ),
    );
  }
}
