import 'package:get/get.dart';
import 'package:getx_tutorial/models/product.dart';

class ShoppingController extends GetxController {
  var products = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: "Some description about product",
          productName: 'abd',
          productImage: 'firstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: "Some description about product",
          productName: 'abd',
          productImage: 'secProd'),
      Product(
          id: 3,
          price: 50,
          productDescription: "Some description about product",
          productName: 'abd',
          productImage: 'thirdProd'),
    ];
    products.value = productResult;
  }
}
