import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/screens/all_items/Allitems.dart';
import 'package:untitled/screens/home/widgets/home_slider.dart';
import 'package:untitled/screens/home/widgets/new_arrival.dart';
import 'package:untitled/screens/home/widgets/new_trending.dart';
import 'package:untitled/screens/home/widgets/products.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/screens/payments/payments.dart';
import 'package:untitled/screens/single_item/singleItem.dart';
import 'package:untitled/widgets/custom_drawer.dart';
import 'package:untitled/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {


  final _imagePaths = [
    './images/discount.jpg',
    './images/holloween.jpg',
    './images/discount2.jpg',
    './images/discount3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: ('hi, ' + (userController.userModel.value.name ?? "")),
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: CustomDrawer(),
        body: SafeArea(
          child: Container(
            color: Colors.white30,
            child: ListView(
              children: <Widget>[
                Container(
                  child: CarouselSlider(
                      options: CarouselOptions(autoPlay: true),
                      items: _imagePaths.map((imagePath) {
                        return Padding(padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Image.asset(imagePath,
                              fit: BoxFit.cover),
                        );
                      }).toList()),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "NEW ARRIVALS",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 150),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllItems(),
                          ));
                        },
                        child: Text("VIEW ALL"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 300,
                  child: NewArrival(),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "TRENDING",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 150),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllItems(),
                          ));
                        },
                        child: Text("VIEW ALL"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 310,
                  child: NewTrending(),
                ),
              ],
            ),
          ),
        ));
  }
}






