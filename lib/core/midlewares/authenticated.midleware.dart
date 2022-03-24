import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticatedMidleware extends GetMiddleware {
  @override
  int get priority => 5;
  bool isAuthenticated = true;

  @override
  RouteSettings? redirect(String? route) {
    
    /*if(UserController.to.isAuthenticated()){
      return RouteSettings(name: '/');
    }*/
    return null;
  }
}