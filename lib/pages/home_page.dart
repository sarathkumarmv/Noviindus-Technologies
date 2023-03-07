import 'package:flutter/material.dart';
import 'package:moovbe/pages/driver_list_page.dart';

import 'bus_page.dart';
import 'bus_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName="/HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Heigth = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70, // Set this height
        flexibleSpace: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: Heigth * 0.03,
              ),
              Container(
                height: Heigth * 0.07,
                child: Center(
                  child: Image.asset("assets/logo.png"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: Heigth * 9,
        child: Column(
          children: [
            SizedBox(
              height: Heigth * 0.01,
            ),
            Container(
              height: Heigth * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(onTap: (){
                    Navigator.of(context).pushReplacementNamed(BusPage2.routeName);
                  },
                    child:Container(
                      height:Heigth * 0.25,
                      width: Width * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bms.png"),
                            fit: BoxFit.fill)),
                  ),),
                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushReplacementNamed(DriverList.routeName);
                  },
                    child: Container(
                        height: Heigth * 0.25,
                        width: Width * 0.45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dmd.png"),
                                fit: BoxFit.fill))),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.03,
                ),
                Text("21"),
                Text("Bus found")
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: GestureDetector(onTap: (){
                        Navigator.of(context)
                            .pushReplacementNamed(BusPage.routeName);
                      },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: Heigth * 0.095,
                          width: Width * 0.4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: Heigth * 0.07,
                                      width: Width * 0.2,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/wbus.png"),
                                              fit: BoxFit.fill))),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("KSRTC"),
                                      Text("Swift Scania p-series"),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "manage",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFfc153b))))
                                ],
                              ),
                              SizedBox(
                                width: Width * 0.01,
                                height: Heigth * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}