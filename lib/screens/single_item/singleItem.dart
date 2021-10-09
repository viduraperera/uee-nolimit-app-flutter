import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/widgets/custom_text.dart';

class SingleItemScreen extends StatelessWidget {

  final ProductModel product;

  const SingleItemScreen({Key key, this.product}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          text: ("Gallery"),
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
    body: SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40),
              child: Image.network(product.image, height: 500, fit: BoxFit.fill,),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(product.name.toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "LKR " +(product.price.toString()),
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4DC6E1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: (){
                    cartController.addProductToCart(product);
                  },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            )
                        ),
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("ADD TO CART "),
                          Icon(Icons.shopping_cart)
                        ],
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1, horizontal: 25),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("More Details", style: TextStyle(fontSize: 25),)),
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("states:     " +product.status, style: TextStyle(fontSize: 15),)),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("whom:      " +product.whom, style: TextStyle(fontSize: 15),)),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("category: "+product.category, style: TextStyle(fontSize: 15),)),
                  SizedBox(height: 5),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
    ),
    ),
    );
  }
}
