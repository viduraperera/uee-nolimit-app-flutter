import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/models/user.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;

  const UserProfile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Obx(() =>(
          Text(userController.userModel.value.name)
            ),),
          ],
        ),
      ),
    );
  }
}
