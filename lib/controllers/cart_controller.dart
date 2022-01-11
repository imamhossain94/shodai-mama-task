import 'package:get/get.dart';

class CartController extends GetxController {
  var containerWidth = 50.0.obs;
  var isCollapse = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void updateWidth() {
    if(containerWidth.value == 50.0){
      containerWidth.value = 250.0;
    }else{
      isCollapse.value = true;
      containerWidth.value = 50.0;
    }
  }

  void updateContainerState() {
    if(isCollapse.value == true && containerWidth.value == 250.0){
      isCollapse.value = false;
    }
  }


}