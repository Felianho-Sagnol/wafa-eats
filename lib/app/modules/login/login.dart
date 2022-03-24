// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/app/widgets/drawer.widget.dart';
import 'package:fooddelivery/core/utils/form.inpput.decoration.dart';
import 'package:fooddelivery/core/values/app.color.dart';
import 'package:fooddelivery/core/values/text.size.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController =
      new TextEditingController();
  final TextEditingController passwordEditingController =
      new TextEditingController();
  final TextEditingController codeEditingController =
      new TextEditingController();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //elevation: 0.5,
          centerTitle: true,
          title: Text(
            "Connexion",
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
                    Image(image: AssetImage('assets/images/loginImage.png')),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailEditingController,
                            decoration: textInputDecoration(
                                "Adresse E-mail", "E-mail ..."),
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
                          SizedBox(height: 20),
                          TextFormField(
                            cursorColor: primaryColor,
                            obscureText: true,
                            controller: passwordEditingController,
                            decoration: textInputDecoration(
                                "Mot de Passe", "Mot de passe ..."),
                            validator: (val) {
                              if (val!.isEmpty || val.length < 6) {
                                return "Le mot de passe doit faire aumoins 6 characters.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: (checkboxValue) ? 20 : 0),
                          (checkboxValue)
                              ? TextFormField(
                                  cursorColor: primaryColor,
                                  obscureText: true,
                                  controller: codeEditingController,
                                  decoration: textInputDecoration("Code Liveur",
                                      "Votre code de livreur ..."),
                                  validator: (val) {
                                    if ((val!.isEmpty || val.length < 6) &&
                                        checkboxValue) {
                                      return "Le code livreur n'est pas valide.";
                                    }
                                    return null;
                                  },
                                )
                              : Text(""),
                          SizedBox(height: 5),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        activeColor: primaryColor,
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                            print(checkboxValue);
                                          });
                                        },
                                      ),
                                      Text(
                                        "C'est un compte pour un livreur ?",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/resetpassword');
                              },
                              child: Text(
                                "Mot de passe oublié ?",
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
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
                                    String password =
                                        this.passwordEditingController.text;

                                    print(email + "----" + password);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Se Connecter',
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
