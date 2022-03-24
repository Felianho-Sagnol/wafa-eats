// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/core/utils/form.inpput.decoration.dart';
import 'package:fooddelivery/core/values/app.color.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //elevation: 0.5,
          centerTitle: true,
          title: Text(
            "Recuperation mot de passe",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top:0,right:25,left:25,bottom:25),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/forgotpasswordImage.png')),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          TextFormField(
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailEditingController,
                            decoration: textInputDecoration(
                                "Adresse E-mail", "Votre adresse e-mail ..."),
                            validator: (val) {
                              if (val!.isEmpty ||
                                  !RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                                  ).hasMatch(val)) {
                                return "Entrer une adresse e-mail valide.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 50),
                          Container(
                            height: 45.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: primaryColor,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    String email =
                                        this.emailEditingController.text;
                                   

                                    print(email);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Recupérer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Pas de compte ?  ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Créer',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed('/register');
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                      },
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
