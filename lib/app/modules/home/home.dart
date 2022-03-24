// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fooddelivery/app/widgets/drawer.widget.dart';
import 'package:fooddelivery/core/values/text.size.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        appBar: AppBar(
          //elevation: 0.5,
          title: Text(
            "Wafa Eats",
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
