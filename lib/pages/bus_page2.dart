import 'package:flutter/material.dart';

import 'home_page.dart';

class BusPage2 extends StatefulWidget {
  const BusPage2({Key? key}) : super(key: key);
  static const routeName="/BusPage";
  @override
  State<BusPage2> createState() => _BusPage2State();
}

class _BusPage2State extends State<BusPage2> {
  @override
  Widget build(BuildContext context) {
    final Heigth = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Swift Scania p-series"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(HomePage.routeName);
          },
          icon: const Icon(
            Icons.arrow_back,
            color:  Colors.white,
            size: 25,
          ),
        ),
        backgroundColor:Color(0xFF050505) ,
      ),
      body: Container(margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: Heigth * 0.15,
              width: Width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Heigth * 0.1,
                    width: Width * 0.45,
                    color: Colors.black,
                    child: Column(
                      children: [
                        SizedBox(
                          height:Heigth*0.02 ,
                        ),
                        Text("Rohit sharma",style: TextStyle(color: Colors.white,fontSize: 25),),
                        Text("License no: PJ515196161655",style: TextStyle(color: Colors.white,fontSize: 8),),
                      ],
                    ),
                  ),
                  Container(
                      height: Heigth * 0.15,
                      width: Width * 0.40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("assets/driver.png"),
                              fit: BoxFit.fill))),
                ],
              ),
            ),
            SizedBox(
              height:Heigth*0.04 ,
            ),
            Card(
              child: Container(
                  height: Heigth * 0.6,
                  width: Width * 0.70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/seat3.png")))),
            ),

          ],
        ),
      ),

    );
  }
}