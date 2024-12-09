import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart'; // Import AppRoutes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Rute awal
      getPages: AppRoutes.routes, // Gunakan rute dari AppRoutes
    );
  }
}
