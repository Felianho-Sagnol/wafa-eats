import 'package:flutter/material.dart';
import 'package:fooddelivery/app/widgets/drawer.widget.dart';
import 'package:fooddelivery/core/values/text.size.dart';
import 'package:get/get.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({ Key? key }) : super(key: key);

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        appBar: AppBar(
          //elevation: 0.5,
          title: Text(
            "restaurant",
            style: TextStyle(
              color: Colors.white,
              fontSize: size1,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                Get.toNamed("/login");
              },
              icon: Icon(
                Icons.person_add_alt,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Text('welcome'),
      ),
    );
  }
}