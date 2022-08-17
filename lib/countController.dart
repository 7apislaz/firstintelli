import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt counter = 0.obs;

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }

  void putNumber(int val){
    counter(val);
  }

  @override
  void onInit() {
    super.onInit();
  }
}