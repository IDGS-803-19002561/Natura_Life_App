import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:natura_life/providers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilProvider extends ChangeNotifier {
  static final UtilProvider rtp = UtilProvider._();
  UtilProvider._();

  Future responseHTTP({required String urlBase}) async {
    final prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(urlBase), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Allow-Control-Allow-Origin': '*',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    });
    return response;
  }

  Future bodyHTTP(
      {required String urlBase, required LoginFormProvider lfp}) async {
    var response = await http.post(Uri.parse(urlBase),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'correo': lfp.user, 'password': lfp.password}));

    return response;
  }

  Future apiRest({required String urlBase}) async {
    var response = await http.get(Uri.parse(urlBase), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return response;
  }

  Future deleteHTTP({required int id, required String urlBase}) async {
    var response = await http.delete(Uri.parse(urlBase), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return response;
  }
}
