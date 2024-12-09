import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardController extends GetxController {
  // Total penjualan dan jumlah transaksi
  var totalSales = 0.0.obs;
  var transactionCount = 0.obs;

  // Data untuk grafik penjualan
  var salesData = <FlSpot>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDashboardData();
  }

  // Contoh fungsi untuk mengisi data
  void _loadDashboardData() {
    // Data dummy
    totalSales.value = 1500000; // Contoh total penjualan
    transactionCount.value = 25; // Contoh jumlah transaksi

    // Data grafik (contoh menggunakan FlSpot untuk grafik)
    salesData.value = [
      FlSpot(0, 3),
      FlSpot(1, 5),
      FlSpot(2, 2),
      FlSpot(3, 8),
      FlSpot(4, 6),
      FlSpot(5, 7),
      FlSpot(6, 4),
    ];
  }
}
