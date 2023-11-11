// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_add_to_cart/controllers/cart_controller.dart';
import 'package:getx_add_to_cart/controllers/shopping_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartController = Get.put(CartController());
  final cartAddingController = Get.put(CartAddingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<CartController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: cartController.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
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
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        "${controller.products[index].productDescription}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${controller.products[index].price}",
                                    style: const TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    cartAddingController
                                        .addToCart(controller.products[index]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor:
                                          Colors.white // foreground
                                      ),
                                  child: const Text("Add to Cart"))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartAddingController>(builder: (controller) {
              return Text(
                "Total Amount: \$ ${controller.totalPrice}",
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.black,
          icon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          label: GetX<CartAddingController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          })),
    );
  }
}
