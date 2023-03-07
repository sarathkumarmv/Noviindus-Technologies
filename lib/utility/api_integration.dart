import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:moovbe/utility/bus_details.dart';
import 'driver_details.dart';
import 'login_reponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static Future<DriverDetails> getdriverlist(
      {required String apikey, required String token}) async {
    final url =
    Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');

    final resp = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    final json = jsonDecode(resp.body);

    final data = DriverDetails.fromJson(json);
    log(data.driverListApi.length.toString());

    return data;
  }

  static Future<Loginresponse> login(
      {required String username, required String password}) async {
    final url = Uri.parse('http://flutter.noviindus.co.in/api/LoginApi');

    final resp = await http.post(url, body: {
      "username": username,
      "password": password,
    });

    final json = jsonDecode(resp.body);
    final data = Loginresponse.fromJson(json);

    log(data.urlId);
    final sharepreferances = await SharedPreferences.getInstance();

    sharepreferances.setString('apikey', data.urlId);

    sharepreferances.setString('token', data.access);

    return data;
  }

  static Future<BusDetails> getbuslist({required String apikey}) async {
    final url =
    Uri.parse('http://flutter.noviindus.co.in/api/BusListApi/$apikey/');

    final resp = await http.get(url);
    final json = jsonDecode(resp.body);
    final data = BusDetails.fromJson(json);

    return data;
  }

  static Future<void> deleteDriver(
      {required String apikey,
        required int driverid,
        required String token}) async {
    final url =
    Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');

    final String id = driverid.toString();

    await http.delete(url, body: {
      "driver_id": id,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
  }

  static Future<void> addDriver(
      {required String apikey,
        required String mobile,
        required String name,
        required String license,
        required String token, required String licenseno}) async {
    log('message');
    final url =
    Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');

    await http.post(url, body: {
      "name": name,
      "mobile": mobile,
      "license_no": license,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
  }

  updateDriver(
      {required String apikey,
        required busid,
        required driverid,
        required String token}) async {
    final url = Uri.parse(
        'http://flutter.noviindus.co.in/api/AssignDriverApi/$apikey/');
    await http.post(url, body: {
      "bus_id": busid,
      "driver_id": driverid,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
  }
}