import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/screens/catagory/widgets/category.dart';
import 'package:untitled/screens/home/widgets/single_product.dart';
import 'package:untitled/screens/single_item/singleItem.dart';

class CardItem {
  final String newImage;
  final String title;
  final List<ProductModel> items;

  const CardItem({
    this.newImage,
    this.title,
    this.items
  });
}


class Ladies extends StatelessWidget {

  List<CardItem> items = [
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Ftops.png?alt=media&token=51e5d282-e79b-4ccf-84ed-3cbcbb9cac67',
      title: "Tops",
      items: producsController.categoryTops
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fpants.png?alt=media&token=f78a41d2-ad5a-452b-b706-a28c08cf53d6',
      title: "Pants",
      items: producsController.categoryPants
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fdresses.png?alt=media&token=5b251d74-90cb-4450-b57f-87066aa0c3e2',
      title: "Dresses",
      items: producsController.categoryDresses
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      separatorBuilder: (context, _) => SizedBox(width: 5),
      itemBuilder: (context, index) =>
          buildCard(item: items[index], context: context),
    );

  }
}

Widget buildCard({CardItem item, BuildContext context}) =>
    Container(
      width: 140,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4/3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child:Material(
                  child: Ink.image(
                    image: NetworkImage(item.newImage),
                    fit: BoxFit.cover,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Categories(items: item.items,),
                          ));
                        }
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(item.title),
        ],
      ),
    );

