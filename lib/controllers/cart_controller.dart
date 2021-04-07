import 'package:get/get.dart';
import 'package:getx_tutorial/models/product.dart';

class CartController extends GetxController {
  var carItems = [].obs;
//  int get count => carItems.length;
  double get totalPrice => carItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    carItems.add(product);
  }
}
