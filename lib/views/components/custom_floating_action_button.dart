import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/cart_controller.dart';
import 'package:sizer/sizer.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          height: 7.5.h,
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
        height: 7.5.h,
        width: cartController.containerWidth.value,
        padding: !cartController.isCollapse.value
            ? EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 5.w): EdgeInsets.zero,
        decoration: BoxDecoration(
            color: !cartController.isCollapse.value
                ? Colors.white
                : const Color(0xFF006A4E),
            borderRadius: BorderRadius.circular(3.75.h),
            border: Border.all(color: const Color(0xFF006A4E), width: 2.0)),
        alignment: Alignment.center,
        child: cartController.isCollapse.value
            ? Icon(
                icon,
                size: 18.sp,
                color: Colors.white,
              )
            : Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "Items: ${cartController.count}",
                        style: TextStyle(color: const Color(0xFF006A4E), fontSize: 10.sp),
                      ),
                      Text(
                        "Total: ৳${cartController.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(color: const Color(0xFF006A4E), fontSize: 10.sp),
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
                            color: const Color(0xFF006A4E),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "PLACE ORDER",
                          style: TextStyle(color: Colors.white, fontSize: 10.sp),
                        )),
                  ))
                ],
              ),
      ),
    );
  }
}
