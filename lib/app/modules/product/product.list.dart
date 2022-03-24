import 'package:flutter/material.dart';
import 'package:fooddelivery/app/widgets/drawer.widget.dart';
import 'package:fooddelivery/core/values/text.size.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        appBar: AppBar(
          //elevation: 0.5,
          title: Text(
            "product list",
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