import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_integration.dart';
import 'driver_details.dart';

Future deleteDriver(
    {required int index,
      required List driverlist,
      required BuildContext context}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final apikey = sharedPreferences.getString('apikey');
  final apitoken = sharedPreferences.getString('token');

  Network.deleteDriver(
      apikey: apikey!, driverid: driverlist[index].id, token: apitoken!);

  showsnackbar(context: context, msg: 'Deleted');
}

Future addDriver(
    {required String name,
      required String license,
      required BuildContext context}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final apikey = sharedPreferences.getString('apikey');
  final apitoken = sharedPreferences.getString('token');

  await Network.addDriver(
      apikey: apikey!,
      mobile: '7034612195',
      name: name,
      licenseno: license,
      token: apitoken!, license: '');

  showsnackbar(context: context, msg: 'Driver Added');
}

Future<List<DriverListApi>> getdata() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final apikey = sharedPreferences.getString('apikey');
  final apitoken = sharedPreferences.getString('token');

  //log(apikey!);
  //log(apitoken!);

  final respList =
  await Network.getdriverlist(apikey: apikey!, token: apitoken!);
  final driverlist = respList.driverListApi;
  // log(driverlist.length.toString());
  return driverlist;
}
showsnackbar({required BuildContext context, required String msg}) {
  final snackbar = SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}