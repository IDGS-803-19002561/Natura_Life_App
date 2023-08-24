import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:natura_life/models/materia_prima.dart'; // Make sure to import the correct model
import 'package:natura_life/utils/constants.dart';

class MateriaPrimaService extends ChangeNotifier {
  List<MateriaPrima> materiasPrimas = [];
  final String _url = Constants.apiUrl;
  final Map<String, String> _headers = Constants.headers;

  MateriaPrimaService() {
    getMateriasPrimas();
  }

  Future<List<MateriaPrima>> getMateriasPrimas() async {
    final url = '$_url/MateriasPrimas'; // Adjust the API endpoint accordingly
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final List<dynamic> decodedData = json.decode(resp.body);
    decodedData.forEach((materiaPrima) {
      final temp =
          MateriaPrima.fromMap(materiaPrima); // Update the model conversion
      materiasPrimas.add(temp);
    });
    notifyListeners();
    return materiasPrimas;
  }

  Future<MateriaPrima> getMateriaPrimaById(int id) async {
    final url =
        '$_url/MateriasPrimas/$id'; // Adjust the API endpoint accordingly
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp =
        MateriaPrima.fromMap(decodedData); // Update the model conversion
    notifyListeners();
    return temp;
  }

  Future<MateriaPrima> createMateriaPrima(MateriaPrima materiaPrima) async {
    final url = '$_url/MateriasPrimas'; // Adjust the API endpoint accordingly
    final resp = await http.post(Uri.parse(url),
        headers: _headers,
        body: materiaPrima.toJson()); // Update the model conversion
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp =
        MateriaPrima.fromMap(decodedData); // Update the model conversion
    notifyListeners();
    return temp;
  }

  Future<MateriaPrima> updateMateriaPrima(MateriaPrima materiaPrima) async {
    final url =
        '$_url/MateriasPrimas/${materiaPrima.idMateriaPrima}'; // Update the property accordingly
    final resp = await http.put(Uri.parse(url),
        headers: _headers,
        body: materiaPrima.toJson()); // Update the model conversion
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp =
        MateriaPrima.fromMap(decodedData); // Update the model conversion
    notifyListeners();
    return temp;
  }

  Future<int> deleteMateriaPrima(int id) async {
    final url =
        '$_url/MateriasPrimas/$id'; // Adjust the API endpoint accordingly
    final resp = await http.delete(Uri.parse(url), headers: _headers);
    notifyListeners();
    return json.decode(resp.body);
  }
}
