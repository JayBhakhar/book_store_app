import 'package:book_store_app/views/pages/Home_Screen/home_controller.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:book_store_app/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            TextButton(
              child: Text('Profile'),
              onPressed: () => Get.toNamed('/profile'),
            ),
            TextButton(
              child: Text('My Cart'),
              onPressed: () => Get.toNamed('/cart'),
            ),
            TextButton(
              child: Text('My Order'),
              onPressed: () => Get.toNamed('/order'),
            ),
            // TextButton(
            //   child: Text('Client Order'),
            //   onPressed: () => Get.toNamed('/clientOrder'),
            // ),
          ],
        )),
      ),
      appBar: AppBar(
        title: Text("Seach Book"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              showSearch(context: context, delegate: BookSearch());
              // final results = await
              //     showSearch(context: context, delegate: Search());

              // print('Result: $results');
            },
          )
        ],
        backgroundColor: Colors.purple,
      ),
      body: controller.obx(
        (_book) => GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _book.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300.0,
            mainAxisExtent: 210,
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 0.5,
          ),
          itemBuilder: (BuildContext context, index) {
            return bookCard(_book, index);
          },
        ),
      ),
    );
  }
}
    
