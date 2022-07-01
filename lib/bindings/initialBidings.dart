import 'package:cash_crop/screens/CartScreen/controller/cart_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
