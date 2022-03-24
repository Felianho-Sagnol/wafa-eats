import 'package:fooddelivery/app/controllers/home.controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    //Get.put(UserController());
  }
}