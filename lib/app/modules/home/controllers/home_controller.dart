import 'package:get/get.dart';

import '../../../data/item_list.dart';
import '../data_model.dart';

class HomeController extends GetxController {
  List<Data>? datas ;
  
  @override
  void onInit() {
         datas = datasFromJson(itemList);
    super.onInit();
  }

   dynamic totalamount = 0;
  dynamic addValue = 0;
  List<Data> cartList = [];
 incrementButton(Data data) {
    if (cartList.contains(data)) {
      data.count = data.count! + 1;
      
            totalamount=totalamount+data.price;

    } else {
      data.count = data.count! + 1;
      cartList.add(data);
        totalamount=totalamount+data.price;
    }

    update();
  }

  decrementButton(Data data) {
    if (data.count! > 0 && data.count! <= 1 && cartList.contains(data)) {
      cartList.remove(data);
      data.count = data.count! - 1;
    } else if (data.count! > 1) {
      data.count = data.count! - 1;
    }

    update();
  }

}
