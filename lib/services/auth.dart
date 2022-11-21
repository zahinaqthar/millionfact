import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:testtextflutter/services/global.dart';

class AuthServices {
  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {"name": name, "email": email, "password": password};
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {"email": email, "password": password};
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }

  static Future<http.Response> logout(String token) async {
    Map<String, String> data = {"Authorization": "Bearer " + token};
    var url = Uri.parse(baseURL + 'auth/logout');
    http.Response response =
        await http.post(url, headers: headers..addAll(data));
    print(response.body);
    return response;
  }

  static Future hasToken() async {
    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    // var token = sharedPreferences.getString('token');
    SharedPreferences local = await SharedPreferences.getInstance();
    final token = local.getString('token') ?? null;
    if (token != null) return token;
    return null;
  }

  static setLocalToken(String token) async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    SharedPreferences local = await _pref;
    local.setString('token', token);
  }

  static Future unsetLocalToken() async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    SharedPreferences local = await _pref;
    local.remove('token');
  }
}
