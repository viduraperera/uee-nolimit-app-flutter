import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/screens/all_items/Allitems.dart';
import 'package:untitled/screens/catagory/catergory.dart';
import 'package:untitled/screens/home/home.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/screens/profile/profile.dart';

import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),
          Obx(()=>UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white30
              ),
              accountName: Text(userController.userModel.value.name ?? "",
              style: TextStyle(
                color: Colors.grey
              ),),
              accountEmail: Text(userController.userModel.value.email ?? "",
              style: TextStyle(
                color: Colors.grey
              ),))),
          ListTile(
            leading: Icon(Icons.person),
            title: CustomText(
              text: "Profile",
            ),
            onTap: ()async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserProfile(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: CustomText(
              text: "Category",
            ),
            onTap: ()async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Category(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_tree_outlined),
            title: CustomText(
              text: "All Items",
            ),
            onTap: ()async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllItems(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: CustomText(
              text: "Feedback",
            ),
            onTap: ()async {},
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: CustomText(
              text: "Payments History",
            ),
            onTap: ()async {
              paymentsController.getPaymentHistory();
            },
          ),
          SizedBox(height: 150),
          ListTile(
            onTap: () {
              userController.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
