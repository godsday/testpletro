import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pletrontest/app/modules/home/controllers/home_controller.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  CartView({Key? key}) : super(key: key);
  final cart = Get.put(CartController());
  final home = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Expanded(
              child: ListView.builder(
                  itemCount: home.cartList.length,
                  itemBuilder: (context, index) {
                    final dataAtIndex = home.cartList[index];
                    cart.totalvalue(dataAtIndex);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${dataAtIndex.name}"),
                          Column(
                            children: [
                              Container(
                                  width: 200,
                                  height: 200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          alignment: Alignment.topCenter,
                                          onPressed: () {
                                            home.decrementButton(dataAtIndex);
                                          },
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          )),
                                      Text(
                                        "${home.datas![index].count}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          alignment: Alignment.center,
                                          onPressed: () {
                                            home.incrementButton(dataAtIndex);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.red,
                                          )),
                                    ],
                                  )),
                              Text(
                                  "\$${cart.value}")
                            ],
                          ),
                        ],
                      ),
                    );
                  }))),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: SizedBox(
            child: Row(
              children: [
                Text("Total"),
                GetBuilder<CartController>(
                  builder: (context) {
                    return Text("${home.totalamount}");
                  }
                ),
              ],
            ),
          )),
    );
  }
}
