// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:fooddelivery/app/modules/forgotpassword/forgotpassword.dart';
import 'package:fooddelivery/app/modules/home/home.dart';
import 'package:fooddelivery/app/modules/login/login.dart';
import 'package:fooddelivery/app/modules/product/product.dart';
import 'package:fooddelivery/app/modules/product/product.list.dart';
import 'package:fooddelivery/app/modules/register/register.dart';
import 'package:fooddelivery/app/modules/restaurant/restaurant.dart';
import 'package:fooddelivery/app/modules/restaurant/restaurant.list.dart';
import 'package:fooddelivery/core/midlewares/authenticated.midleware.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => Home(),
    middlewares: [],
  ),


  GetPage(
    name: '/login',
    page: () => Login(),
    middlewares: [
      AuthenticatedMidleware(),
    ],
  ),
  GetPage(
    name: '/register',
    page: () => Register(),
    middlewares: [
      AuthenticatedMidleware(),
    ],
  ),
  GetPage(
    name: '/resetpassword',
    page: () => ForgotPassword(),
    middlewares: [
      AuthenticatedMidleware(),
    ],
  ),


  GetPage(
    name: '/product',
    page: () => Product(),
    middlewares: [
    ],
  ),
  GetPage(
    name: '/products',
    page: () => ProductList(),
    middlewares: [
    ],
  ),


  GetPage(
    name: '/restaurant',
    page: () => Restaurant(),
    middlewares: [
    ],
  ),
  GetPage(
    name: '/restaurants',
    page: () => RestaurantList(),
    middlewares: [
    ],
  ),
];
