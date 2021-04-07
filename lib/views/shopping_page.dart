import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/cart_controller.dart';
import 'package:getx_tutorial/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.products[index].productName}",
                                          style: TextStyle(fontSize: 21),
                                        ),
                                        Text(
                                          "${controller.products[index].productDescription}",
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\$${controller.products[index].price}",
                                      style: TextStyle(fontSize: 21),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  child: Text("Add to cart"),
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Amount: \$ ${controller.totalPrice}",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              );
            }),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
