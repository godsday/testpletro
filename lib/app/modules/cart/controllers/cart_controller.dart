import 'package:get/get.dart';

class CartController extends GetxController {
  int? totalamout;

  int? value;
  totalvalue(dataAtIndex) {
    value = (dataAtIndex.count) * (dataAtIndex.price);
  }
}
