import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pletrontest/app/data/item_list.dart';
import 'package:pletrontest/app/modules/cart/views/cart_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Expanded(
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    final dataAtIndex = homeController.datas![index];
                    return GetBuilder<HomeController>(builder: (context) {
                      return ListTile(
                        leading: Image.network("${dataAtIndex.image}"),
                        title: Text(dataAtIndex.name.toString()),
                        subtitle: Text("${dataAtIndex.price}"),
                        trailing: dataAtIndex.count == 0
                            ? InkWell(
                                onTap: () {
                                  homeController.incrementButton(dataAtIndex);
                                },
                                child: const Text("Add"),
                              )
                            : SizedBox(
                                width: 200,
                                height: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        alignment: Alignment.topCenter,
                                        onPressed: () {
                                          homeController
                                              .decrementButton(dataAtIndex);
                                        },
                                        icon: const Icon(
                                          Icons.minimize,
                                          color: Colors.red,
                                        )),
                                    Text(
                                      "${homeController.datas![index].count}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          homeController
                                              .incrementButton(dataAtIndex);
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.red,
                                        )),
                                  ],
                                )),

                        // isThreeLine: true,
                      );
                    });
                  }))),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => CartView());
          },
          label: SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<HomeController>(builder: (context) {
                  return Text("${homeController.cartList.length}");
                }),
                const Text("Submit")
              ],
            ),
          )),
    );
  }
}
