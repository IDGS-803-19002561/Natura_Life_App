import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/providers/util_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProvidersProvider extends ChangeNotifier {
  final String _urlBase = 'http://192.168.100.158:7092/api';

  List<dynamic> providers = [];
  var provider = {};

  // ProvidersProvider() {getProviders();}

  Future getProviders() async {
    final String url = '$_urlBase/Proveedores';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      providers = jResponse;
      notifyListeners();
    }
  }

  Future getProviderById({required int id}) async {
    final String url = '$_urlBase/Proveedores/$id';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map<String, dynamic>;
      provider = jResponse;
      notifyListeners();
    }
  }

  Future deleteProvider({required int id}) async {
    final String url = '$_urlBase/Proveedores/$id';
    final response = await UtilProvider.rtp.deleteHTTP(id: id, urlBase: url);
    if (response.statusCode == 200) {
      getProviders();
      notifyListeners();
    }
  }

  Future addProvider({required Map<String, dynamic> provider}) async {
    final String url = '$_urlBase/Proveedores';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(provider));
    if (response.statusCode == 200) {
      getProviders();
      notifyListeners();
    }
  }

  Future editProvider({required Map<String, dynamic> provider}) async {
    final String url = '$_urlBase/Proveedores/${provider['id']}';
    final response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(provider));
    if (response.statusCode == 200) {
      getProviders();
      notifyListeners();
    }
  }
}
