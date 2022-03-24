// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/core/utils/form.inpput.decoration.dart';
import 'package:fooddelivery/core/values/app.color.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final fullNameEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final TextEditingController codeEditingController =
      new TextEditingController();
  bool checkboxValue = false;
  bool checkboxValueForCondition = false;


  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //elevation: 0.5,
          centerTitle: true,
          title: Text(
            "Enregistrement",
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
                    Image(image: AssetImage('assets/images/signupImage.png')),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.text,
                            controller: fullNameEditingController,
                            decoration: textInputDecoration(
                                "Prénom & Nom", "Votre nom complet ..."),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Entrer votre nom complet.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
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
                            keyboardType: TextInputType.text,
                            controller: phoneEditingController,
                            decoration: textInputDecoration(
                                "Téléphone", "Votre numéro de téléphone ..."),
                            validator: (val) {
                              if (val!.isEmpty ||
                                    !RegExp(r"^(\+[0-9]{1,5})?[0-9]{8,}$")
                                        .hasMatch(val)) {
                                  return "Entrer un numéro valide.";
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
                          SizedBox(height: 20),
                          TextFormField(
                            cursorColor: primaryColor,
                            obscureText: true,
                            controller: confirmPasswordEditingController,
                            decoration: textInputDecoration(
                                "Comfirmation du mot de Passe", "Comfirmer le mot de passe ..."),
                            validator: (val) {
                              if ((val!.isEmpty || val.length < 6) && passwordEditingController.text.length >=
                                        6) {
                                  return "Le mot de passe doit faire aumoins 6 characters.";
                                } else if (confirmPasswordEditingController
                                            .text !=
                                        passwordEditingController.text &&
                                    passwordEditingController.text.length >=
                                        6) {
                                  return "Les deux mots de passes ne correspondent pas.";
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
                                        "Etes vous un livreur de Wafa Eats ?",
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
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        activeColor: primaryColor,
                                        value: checkboxValueForCondition,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValueForCondition = value!;
                                            state.didChange(value);
                                            print(checkboxValueForCondition);
                                          });
                                        },
                                      ),
                                      Text(
                                        "J'accepte les conditions d'utilisations .",
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
                            validator: (value) {
                              if (!checkboxValueForCondition) {
                                return "      Vous devez accepter les conditions d'utilisations";
                              } else {
                                return null;
                              }
                            },
                          ),
                          
                          SizedBox(height: 20),
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
                                        emailEditingController.text;
                                    String password =
                                        passwordEditingController.text;

                                    print(email + "----" + password);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Créer mon compte',
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
                                    text: "Déjà inscrit ?  ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Se connecter',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed('/login');
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