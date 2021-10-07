import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/product.dart';


class NewTrending extends StatelessWidget {


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
