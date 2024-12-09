import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () => Get.offNamed('/dashboard'),
          ),
          ListTile(
            title: Text('Kasir'),
            onTap: () => Get.toNamed('/cashier'),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () => Get.toNamed('/profile'),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () => Get.offAllNamed('/'),
          ),
        ],
      ),
    );
  }
}
