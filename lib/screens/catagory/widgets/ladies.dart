import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String newImage;
  final String title;

  const CardItem({
    this.newImage,
    this.title,
  });
}


class Ladies extends StatelessWidget {

  List<CardItem> items = [
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Ftops.png?alt=media&token=51e5d282-e79b-4ccf-84ed-3cbcbb9cac67',
      title: "Tops",
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fpants.png?alt=media&token=f78a41d2-ad5a-452b-b706-a28c08cf53d6',
      title: "Pants",
    ),
    CardItem(
      newImage: 'https://firebasestorage.googleapis.com/v0/b/uee-app.appspot.com/o/category%2Fdresses.png?alt=media&token=5b251d74-90cb-4450-b57f-87066aa0c3e2',
      title: "Dresses",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      separatorBuilder: (context, _) => SizedBox(width: 5),
      itemBuilder: (context, index) =>
          buildCard(item: items[index]),
    );
  }
}

Widget buildCard({
  CardItem item,
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
                        onTap: () {}
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
