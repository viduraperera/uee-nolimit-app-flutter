import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/models/product.dart';

import 'package:untitled/screens/catagory/widgets/category.dart';

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


class Gents extends StatelessWidget {

  List<CardItem> items = [
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fshirt.png?alt=media&token=02ae0e62-4d8c-48b5-87e9-5c214857dbae',
      title: "Shirts",
      items: producsController.categoryShirts
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fdenim.png?alt=media&token=39881eb3-9091-4a43-af34-ca427f644e25',
      title: "Denims",
        items: producsController.categoryDenims
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fshoes.png?alt=media&token=f47cc4a8-3423-486b-a09d-985f50c5f441',
      title: "Shoes",
        items: producsController.categoryShoes
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

Widget buildCard({
  CardItem item, BuildContext context
}) =>
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
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Categories(items: item.items,),
                        ));
                      },
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
