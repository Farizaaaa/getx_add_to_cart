import 'package:get/get.dart';
import 'package:getx_add_to_cart/models/product.dart';

class CartController extends GetxController {
  // var products = List<Product>().obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: "Jacket",
          productImage: "image mine",
          productDescription: "Black Jacket with waterproofing",
          price: 600),
      Product(
          id: 2,
          productName: "Pen",
          productImage: "image pen",
          productDescription: "Blue Gel pen ",
          price: 200),
      Product(
          id: 1,
          productName: "Bun",
          productImage: "image Bun",
          productDescription: "Hair Bun Pink color",
          price: 100)
    ];
    products.value = productResult;
  }
}
