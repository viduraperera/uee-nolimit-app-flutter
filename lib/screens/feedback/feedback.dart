import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/asset_paths.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/widgets/custom_text.dart';

class FeedbackScreen extends StatelessWidget {
  //const Feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          text: ("FeedBack"),
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
            children: [
              SizedBox(height: 40),
              Container(
                width: 350,
                child: Column(
                  children: [
                    Container(
                      width: 360,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 360,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 360,
                      height: 150,
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your text here"),
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xff4DC6E1),
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 25),
                padding: EdgeInsets.all(1),
                child: Text(
                  "Follow us on",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      inster,
                      width: 80,
                    ),
                    Image.asset(
                      facebook,
                      width: 80,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        twitter,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                //fallow us
              )
            ],
          ),
        ),
      ),
    );
  }
}
