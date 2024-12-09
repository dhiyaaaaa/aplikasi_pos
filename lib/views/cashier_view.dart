import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import '../widgets/sidebar.dart';

class CashierView extends StatelessWidget {
  final controller = Get.put(CashierController());
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Kasir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Produk',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: productNameController,
              decoration: InputDecoration(labelText: 'Nama Produk'),
            ),
            TextField(
              controller: productPriceController,
              decoration: InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = productNameController.text;
                final price = double.tryParse(productPriceController.text) ?? 0.0;
                controller.addProduct(name, price);
                productNameController.clear();
                productPriceController.clear();
              },
              child: Text('Tambah'),
            ),
            SizedBox(height: 32),
            Text(
              'Daftar Produk',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      final product = controller.productList[index];
                      return ListTile(
                        title: Text(product.name),
                        trailing: Text('Rp ${product.price}'),
                      );
                    },
                  )),
            ),
            Obx(() => Text(
                  'Total Harga: Rp ${controller.totalPrice.value}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.completeTransaction,
              child: Text('Selesaikan Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}
