import 'package:hive/hive.dart';
import 'package:shodai_mama_task/models/product.dart';

class HiveHelper {
  static Box? cartBox;

  Future init() async {
    cartBox = await Hive.openBox('cartBox');
  }
}

List<dynamic> getCartList() {
  List _cartDatabase = <Product>[];
  _cartDatabase = HiveHelper.cartBox!.values.toList();
  _cartDatabase = _cartDatabase.reversed.toList();
  return _cartDatabase;
}

void addToCart(Product product) async {
  await HiveHelper.cartBox!.add(product);
}

void removeFromCart(Product product) async {
  HiveHelper.cartBox!
      .deleteAt(HiveHelper.cartBox!.values.toList().indexOf(product));
}

int countCartItemById(int id) {
  return HiveHelper.cartBox!.values
      .where((element) => element.id == id)
      .toList()
      .length;
}

void closeHive() {
  HiveHelper.cartBox!.close();
}
