import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/login_view.dart';
import '../views/dashboard_view.dart';
import '../views/cashier_view.dart'; // Perbaikan nama file
import '../views/profile_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LoginView()),
    GetPage(name: '/dashboard', page: () => DashboardView()),
    GetPage(name: '/profile', page: () => ProfileView()),
    GetPage(name: '/cashier', page: () => CashierView()),
  ];
}
