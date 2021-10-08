import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/models/user.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/screens/profile/widget/change_password.dart';
import 'package:untitled/widgets/custom_text.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;

  const UserProfile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          text: ("Profile"),
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
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/profile.jpeg'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Edit photo"),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full Name:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => (Text(
                      userController.userModel.value.name,
                      style: TextStyle(),
                    )),
                  ),
                  Text(
                    "Email:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => (Text(userController.userModel.value.email)),
                  ),
                  Text(
                    "Phone Number: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Arapaima Card Number: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangePassword(),
                      ));
                    },
                    child: Text("Change Password"),
                  ),
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color(0xff4DC6E1),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'SAVE',
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
      ),
    );
  }
}
