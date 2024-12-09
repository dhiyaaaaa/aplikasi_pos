import 'package:get/get.dart';
import '../models/product.dart';

class CashierController extends GetxController {
  var productList = <Product>[].obs;
  var totalPrice = 0.0.obs;

  void addProduct(String name, double price) {
    if (name.isNotEmpty && price > 0) {
      productList.add(Product(name: name, price: price));
      calculateTotal();
    }
  }

  void calculateTotal() {
    totalPrice.value = productList.fold(0, (sum, item) => sum + item.price);
  }

  void completeTransaction() {
    productList.clear();
    totalPrice.value = 0.0;
    Get.snackbar('Sukses', 'Transaksi selesai!',
        snackPosition: SnackPosition.BOTTOM);
  }
}
