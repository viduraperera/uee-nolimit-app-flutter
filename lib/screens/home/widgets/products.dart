import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/single_item/singleItem.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .44,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: producsController.categoryTops.map((ProductModel product) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SingleItemScreen(product: product),
              ));
            },
            child: SingleProductWidget(
              product: product,
            ),
          );
        }).toList()));
  }
}
