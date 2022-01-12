import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/cart_controller.dart';
import 'package:shodai_mama_task/controllers/home_tab_controller.dart';
import 'package:shodai_mama_task/services/hive_helper.dart';
import 'package:sizer/sizer.dart';

class CustomProductCard extends StatefulWidget {
  final HomeTabController controller;
  final int index;

  const CustomProductCard(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  _CustomProductCardState createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  int _counter = 0;

  final cartController = Get.put(CartController());


  @override
  initState(){
    super.initState();
    _counter = countCartItemById(widget
        .controller.productLists.value[widget.index].id!);
  }



  @override
  Widget build(BuildContext context) {
    return Obx(()=>Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget
                            .controller.productLists.value[widget.index].image!,
                        fit: BoxFit.cover,
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.controller.productLists.value[widget.index]
                                  .title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                          child: Text(
                            "each",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: const Color(0xFF9C9C9C),
                                fontSize: 10.sp,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                          child: Text(
                            "৳ " +
                                widget.controller.productLists
                                    .value[widget.index].price!
                                    .toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.motorcycle,
                              color: Colors.redAccent,
                              size: 12.sp,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Next Morning",
                              style: TextStyle(
                                  fontSize: 10.sp, color: const Color(0xFF9C9C9C)),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(3)),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.solidStar, size: 10.sp, color: Colors.yellow,),
                    const SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        widget
                            .controller.productLists.value[widget.index].rating!.rate
                            .toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _counter > 0
                  ? CartStepperInt(
                count: _counter,
                radius: Radius.zero,
                size: 5.5.h,
                elevation: 0,
                deActiveForegroundColor: Colors.black,
                activeForegroundColor: Colors.white,
                activeBackgroundColor: Colors.deepOrangeAccent,
                didChangeCount: (count) {

                  if(count > _counter){
                    cartController.addCart(widget.controller.productLists
                        .value[widget.index]);
                  }else{
                    cartController.removeCart(widget.controller.productLists
                        .value[widget.index]);
                  }
                  setState(() {
                    _counter = count;
                  });
                },
              )
                  : GestureDetector(
                onTap: () {
                  setState(() {
                    _counter++;
                  });
                  cartController.addCart(widget.controller.productLists
                      .value[widget.index]);
                },
                child: Container(
                  height: 5.5.h,
                  color: const Color(0xFF006A4E),
                  alignment: Alignment.center,
                  child: Text(
                    "Add To Card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12.sp
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }





}
