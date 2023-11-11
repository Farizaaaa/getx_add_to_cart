
import 'package:get/get.dart';
import 'package:getx_add_to_cart/models/product.dart';

class CartAddingController extends GetxController {
  var cartItems = <Product>[].obs;

  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
