import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/providers/util_provider.dart';
import 'package:http/http.dart' as http;

class MateriasPrimasProvider extends ChangeNotifier {
  // final String _urlBase = 'http://192.168.100.158:7092/api';
  final String _urlBase = 'http://localhost/api';

  List<dynamic> materiasPrimas = [];
  var materiaPrima = {};

  MateriasPrimasProvider() {
    getMateriasPrimas();
  }

  Future getMateriasPrimas() async {
    // final String url = '$_urlBase/MateriasPrimas';
    final String url = '$_urlBase/MateriasPrimas.php';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      materiasPrimas = jResponse;
      notifyListeners();
    }
  }

  Future getMateriaPrimaById({required int id}) async {
    // final String url = '$_urlBase/MateriasPrimas/$id';
    final String url = '$_urlBase/MateriasPrimas.php?id=$id';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map<String, dynamic>;
      materiaPrima = jResponse;
      notifyListeners();
    }
  }

  Future deleteMateriaPrima({required int id}) async {
    // final String url = '$_urlBase/MateriasPrimas.php/$id';
    final String url = '$_urlBase/MateriasPrimas.php?id=$id';
    final response = await UtilProvider.rtp.deleteHTTP(id: id, urlBase: url);
    if (response.statusCode == 200) {
      getMateriasPrimas();
      notifyListeners();
    }
  }

  Future addMateriaPrima({required MateriaPrima materiaPrima}) async {
    // final String url = '$_urlBase/MateriasPrimas';
    final String url = '$_urlBase/MateriasPrimas.php';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(materiaPrima));
    if (response.statusCode == 200) {
      getMateriasPrimas();
      notifyListeners();
    }
  }

  Future editMateriaPrima({required Map<String, dynamic> materiaPrima}) async {
    // final String url = '$_urlBase/MateriasPrimas/${materiaPrima['id']}';
    final String url = '$_urlBase/MateriasPrimas.php';
    final response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(materiaPrima));
    if (response.statusCode == 200) {
      getMateriasPrimas();
      notifyListeners();
    }
  }
}
