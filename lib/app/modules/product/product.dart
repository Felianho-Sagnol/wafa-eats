import 'package:flutter/material.dart';
import 'package:fooddelivery/app/widgets/drawer.widget.dart';
import 'package:fooddelivery/core/values/text.size.dart';
import 'package:get/get.dart';

class Product extends StatefulWidget {
  const Product({ Key? key }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        appBar: AppBar(
          //elevation: 0.5,
          title: Text(
            "product",
            style: TextStyle(
              color: Colors.white,
              fontSize: size1,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                print("adding user");
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