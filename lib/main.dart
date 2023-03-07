import 'package:flutter/material.dart';
import 'package:moovbe/pages/add_driver_page.dart';
import 'package:moovbe/pages/bus_page.dart';
import 'package:moovbe/pages/bus_page2.dart';
import 'package:moovbe/pages/driver_list_page.dart';
import 'package:moovbe/pages/home_page.dart';
import 'package:moovbe/pages/login_page.dart';
import 'package:moovbe/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(uvalue: 'admin_user', pvalue: '123admin789',),
        HomePage.routeName: (context) => HomePage(),
        BusPage.routeName: (context) => BusPage(),
        BusPage2.routeName: (context) => BusPage2(),
        DriverList.routeName: (context) => DriverList(driverlist: [],),
        AddDriver.routeName: (context) => AddDriver(),
      }
    );
  }
}

