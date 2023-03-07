import 'dart:developer';

import 'package:flutter/material.dart';

import '../utility/api_integration.dart';
import '../utility/login_reponse.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.uvalue, required this.pvalue});

  static const routeName="/LoginPage";

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  static final _formkey = GlobalKey<FormState>();
  final String uvalue;
  final String pvalue;
   // String? Function(String?) validatorFunction;
 // TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
                children: [
                  Container(
                        color: const Color(0xFF2B2B2B),
                        height: 0.3 * screenHeight,
                        width: screenWidth,
                        child: Stack(
                          children:[
                            Align(
                              alignment: Alignment.topRight,
                              child: Image.asset('assets/polygon1.png')),

                            Padding(
                              padding: EdgeInsets.only(
                                right: 0.07 * screenWidth,
                                left: 0.07 * screenWidth,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 0.13 * screenHeight,),
                                  Text('Welcome',
                                   style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 0.01 * screenHeight,),
                                  Text('Manage Your Bus and Drivers',
                                    style: TextStyle(fontSize: 19, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                  ),
                  SizedBox( height: 0.06 * screenHeight,),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 0.035 * screenHeight,
                      left: 0.035 * screenHeight,
                    ),
                    child: SizedBox(
                      width: screenWidth,
                      height: 0.6 * screenHeight,
                      child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required';
                                  } else if (uvalue != value) {
                                    return "Enter valid field";
                                  } else {
                                    return null;
                                  }
                                },
                                textAlign:TextAlign.center,
                                controller: usernamecontroller,
                                decoration: const InputDecoration(
                                  filled:true,
                                  fillColor: Color.fromARGB(255, 227, 222, 222),
                                  hintText: "Enter Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)))),
                              ),
                              SizedBox( height: 0.02 * screenHeight,),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required';
                                  } else if (pvalue != value) {
                                    return "Enter valid field";
                                  } else {
                                    return null;
                                  }
                                },
                                textAlign:TextAlign.center,
                                controller: passwordcontroller,
                                decoration: const InputDecoration(
                                hintText: "Enter Password",
                                filled:true,
                                fillColor: Color.fromARGB(255, 227, 222, 222),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)))),
                              ),
                              const Spacer(),
                              SizedBox(width:screenWidth,
                              child:ElevatedButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    final Loginresponse data = await Network.login(
                                      username: usernamecontroller.text,
                                      password: passwordcontroller.text);
                                      if (data.status == true) {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return HomePage();
                                          },
                                        ));
                                      } else {
                                        log('message');
                                      }
                                  }
                                },
                                style:const ButtonStyle( backgroundColor:MaterialStatePropertyAll(Colors.red),),
                   /* onPressed: () {
                     Navigator.of(context)
                         .pushReplacementNamed(HomePage.routeName);

                   },*/
                                child: const Text('Login',style: TextStyle(color: Colors.white)),
                              ),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                ]
            ),
          ),

    );
  }
}