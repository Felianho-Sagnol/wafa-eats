import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  var counter = 0.obs;
  void increment() {
    
    counter++;
    //update(); 
    print(counter.toString());
  }
}