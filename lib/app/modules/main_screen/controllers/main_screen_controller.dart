import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
