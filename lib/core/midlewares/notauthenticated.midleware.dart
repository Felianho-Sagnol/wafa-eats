import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotAuthenticatedMidleware extends GetMiddleware {
  @override
  int get priority => 4;
  bool isAuthenticated = false;


  @override
  RouteSettings? redirect(String? route) {
    /*if(!UserController.to.isAuthenticated()){
      return RouteSettings(name: '/login');
    }*/
    return null;
  }
}