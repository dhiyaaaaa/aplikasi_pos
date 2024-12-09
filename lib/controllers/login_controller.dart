import 'package:get/get.dart';

class LoginController extends GetxController {
   var username = ''.obs;
  var password = ''.obs;
  var isLoggedIn = false.obs;

  void login (String username, String password) {
    if (username =='H1D021040' && password =='12345') {
      isLoggedIn.value = true;
      Get.offAllNamed('/dashboard');
    }else{
      Get.snackbar('Error', 'Username atau passsword salah');
    }
  }
}