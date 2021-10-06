import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/screens/all_items/Allitems.dart';
import 'package:untitled/screens/home/widgets/new_arrival.dart';
import 'package:untitled/screens/home/widgets/new_trending.dart';
import 'package:untitled/screens/home/widgets/products.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/screens/payments/payments.dart';
import 'package:untitled/widgets/custom_drawer.dart';
import 'package:untitled/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    producsController.addToTrending();
    producsController.addToNewArrivals();
  }

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
                  padding: EdgeInsets.all(50),
                  child: Row(),
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
                        onPressed: () {},
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
                        onPressed: () {},
                        child: Text("VIEW ALL"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 300,
                  child: NewTrending(),
                ),
              ],
            ),
          ),
        ));
  }
}



