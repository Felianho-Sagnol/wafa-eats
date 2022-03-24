import 'package:fooddelivery/app/modules/forgotpassword/forgotpassword.dart';
import 'package:fooddelivery/app/modules/home/home.dart';
import 'package:fooddelivery/app/modules/login/login.dart';
import 'package:fooddelivery/app/modules/register/register.dart';
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
];
