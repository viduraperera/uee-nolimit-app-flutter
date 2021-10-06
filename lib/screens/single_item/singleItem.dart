import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              child: Image.asset("name"),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("name of item"),
                        Text("price of item"),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){}, 
                      child: Text("add to cart"),
                  ),
                ],
              ),
            ),
            Text("size"),
            Container(
              child: Column(
                children: <Widget>[
                  Text("details")
                ],
              ),
            ),
          ],
        ),
    ),
    );
  }
}
