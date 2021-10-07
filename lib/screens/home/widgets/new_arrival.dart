import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/models/product.dart';



class NewArrival extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Obx(() =>ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: producsController.newArrival.length,
      separatorBuilder: (context, _) => SizedBox(width: 5),
      itemBuilder: (context, index) =>
          buildCard(item: producsController.newArrival[index]),
    ));
  }
}

Widget buildCard({
  ProductModel item,
}) =>
    Container(
      width: 140,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 2),
          Text(item.name),
          Text("LKR " + item.price.toString(),
          style: TextStyle(
            fontSize: 15, color: Colors.lightBlue
          ),),
        ],
      ),
    );
