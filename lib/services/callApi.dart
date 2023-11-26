import 'dart:convert' show json;
import 'package:dashboard/screens/login.dart';
import 'package:dashboard/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  Future<List<dynamic>?> fetchGetData(
    String link,
    Map<String, String>? headers,
    // Make the 'headers' parameter nullable
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final String tenent = prefs.getString('id') ?? '';
    final String baseUrl = prefs.getString('baseUrl') ?? '';

    final Uri url = Uri.parse('$baseUrl$link');

    headers ??= {}; // If 'headers' is null, initialize it as an empty map

    headers.addAll({
      'Authorization': 'Bearer $token',
      'Tenent': tenent,
      'Content-Type': 'application/json',
    });
    final http.Response response = await http.get(url, headers: headers);
    print(token);
    print("======================");
    if (response.statusCode == 200) {
      return json.decode(response.body).toList();
    }
    return null;
  }

  Future<List<dynamic>?> fetchGetHomeData(
    String link,
    Map<String, String>? headers,
    BuildContext context,
    // Make the 'headers' parameter nullable
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final String tenent = prefs.getString('id') ?? '';
    final String baseUrl = prefs.getString('baseUrl') ?? '';

    final Uri url = Uri.parse('$baseUrl$link');

    headers ??= {}; // If 'headers' is null, initialize it as an empty map

    headers.addAll({
      'Authorization': 'Bearer $token',
      'Tenent': tenent,
      'Content-Type': 'application/json',
    });
    final http.Response response = await http.get(url, headers: headers);
    print(token);
    print("======================");
    if (response.statusCode == 200) {
     
      return json.decode(response.body).toList();
    } else if (response.statusCode == 401) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('refreshTokenExpiration');
 Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft, child: const MyLogin()));
  
    }
    return null;
  }

  Future<Map<String, dynamic>?> fetchGetDataforEditingpage(
    String link,
    Map<String, String>? headers, // Make the 'headers' parameter nullable
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final String tenent = prefs.getString('id') ?? '';
    final String baseUrl = prefs.getString('baseUrl') ?? '';

    final Uri url = Uri.parse('$baseUrl$link');

    headers ??= {}; // If 'headers' is null, initialize it as an empty map

    headers.addAll({
      'Authorization': 'Bearer $token',
      'Tenent': tenent,
      'Content-Type': 'application/json'
    });

    final http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  Future<bool> deleteApi(
    String link,
    Map<String, String>? headers, // Make the 'headers' parameter nullable
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final String tenent = prefs.getString('id') ?? '';
    final String baseUrl = prefs.getString('baseUrl') ?? '';

    final Uri url = Uri.parse('$baseUrl$link');

    headers ??= {}; // If 'headers' is null, initialize it as an empty map

    headers.addAll({
      'Authorization': 'Bearer $token',
      'Tenent': tenent,
      'Content-Type': 'application/json',
    });

    final http.Response response = await http.delete(url, headers: headers);

    if (response.statusCode == 204) {
      // Successful delete response has a status code of 204 (No Content)
      return true;
    }
    return false;
  }

  Future<dynamic> fetchPostData(
    String link,
    Map<String, String>? headers,
    dynamic body, // Make the 'body' parameter dynamic to accept any type
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final String tenent = prefs.getString('id') ?? '';
    final String baseUrl = prefs.getString('baseUrl') ?? '';

    final Uri url = Uri.parse('$baseUrl$link');

    headers ??= {}; // If 'headers' is null, initialize it as an empty map

    headers.addAll({
      'Authorization': 'Bearer $token',
      'Tenent': tenent,
      "Content-Type": "application/json",
    });

    final http.Response response =
        await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future<dynamic> postDataforEditingPage(
    String link,
    Map<String, String>? headers,
    dynamic body, // Make the 'body' parameter dynamic to accept any type
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    final String tenent = prefs.getString('id') ?? '';
    final String baseUrl = prefs.getString('baseUrl') ?? '';

    final Uri url = Uri.parse('$baseUrl$link');

    headers ??= {}; // If 'headers' is null, initialize it as an empty map

    headers.addAll({
      'Authorization': 'Bearer $token',
      'Tenent': tenent,
      "Content-Type": "application/json"
    });

    // ignore: unused_local_variable
    final http.Response response =
        await http.post(url, headers: headers, body: body);
  }
}
