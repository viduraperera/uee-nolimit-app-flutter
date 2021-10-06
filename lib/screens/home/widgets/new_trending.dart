import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/product.dart';

class CardItem {
  final String newImage;
  final String title;

  const CardItem({
    this.newImage,
    this.title,
  });
}


class NewTrending extends StatelessWidget {

  List<CardItem> items = [
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/new1.png?alt=media&token=263edf24-bf86-476b-b926-78056186edb4',
      title: "blouse1",
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/new2.png?alt=media&token=573ea92c-bd19-4d6a-bba2-f7dc43bdf851',
      title: "blouse2",
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/new3.png?alt=media&token=7c6c0d64-9114-460b-b029-aca921ef039d',
      title: "blouse3",
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/new4.png?alt=media&token=2064fb7e-660b-4aaf-b4dd-adf4f0b3f6be',
      title: "blouse4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: producsController.trending.length,
      separatorBuilder: (context, _) => SizedBox(width: 5),
      itemBuilder: (context, index) =>
          buildCard(item: producsController.trending[index]),
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
        ],
      ),
    );
