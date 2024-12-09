import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/sidebar.dart';

class DashboardView extends StatelessWidget {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Penjualan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SummaryCard(
                    title: 'Total Penjualan',
                    value: 'Rp ${controller.totalSales.value}',
                  ),
                  SummaryCard(
                    title: 'Jumlah Transaksi',
                    value: '${controller.transactionCount.value}',
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Grafik Penjualan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 10,
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.salesData.value,
                        isCurved: true,
                        barWidth: 4,
                        colors: [Colors.blue],  // Ensure that this works with the correct property.
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
