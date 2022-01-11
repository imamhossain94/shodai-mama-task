
import 'package:get/get.dart';
import 'package:shodai_mama_task/models/product.dart';
import 'package:shodai_mama_task/services/remote_service.dart';

class HomeTabController extends GetxController {
  var fetchingProcess = false.obs;
  var productLists = RxList<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    String? error;
    try {
      fetchingProcess(true);
      dynamic productResponse = await RemoteService.fetchProduct();

      if (productResponse != null) {
        List<dynamic> dataList = productResponse != null ? List.from(productResponse) : [];
        for (dynamic item in dataList) {
          productLists.value.add(Product.fromJson(item));
        }
      } else {
        error = "error";
      }
    } finally {
      fetchingProcess(false);
    }

    print(productLists.value.length);

  }

}