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
              child: Image.network(product.image, height: 450, fit: BoxFit.fill,),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(product.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "LKR " +(product.price.toString()),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff4DC6E1),
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
            Text("size " +product.size),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(product.status, style: TextStyle(fontSize: 15),),
                  Text(product.whom, style: TextStyle(fontSize: 15),),
                  Text(product.category, style: TextStyle(fontSize: 15),),
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
